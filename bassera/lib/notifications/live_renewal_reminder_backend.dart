import 'package:baseera/models/subscription.dart';
import 'package:baseera/notifications/renewal_reminder_backend.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

class LiveRenewalReminderBackend implements RenewalReminderBackend {
  LiveRenewalReminderBackend();

  static const String _androidChannelId = 'baseera_renewals';

  final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();

  @override
  Future<void> init() async {
    if (kIsWeb) {
      return;
    }
    tzdata.initializeTimeZones();
    try {
      final String zoneName = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(zoneName));
    } on Object {
      tz.setLocalLocation(tz.UTC);
    }

    const AndroidInitializationSettings androidInit =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings darwinInit = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    await _plugin.initialize(
      const InitializationSettings(
        android: androidInit,
        iOS: darwinInit,
        macOS: darwinInit,
      ),
    );

    await _ensureAndroidChannel();
    await _requestPlatformPermissions();
  }

  Future<void> _ensureAndroidChannel() async {
    final AndroidFlutterLocalNotificationsPlugin? android = _plugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await android?.createNotificationChannel(
      const AndroidNotificationChannel(
        _androidChannelId,
        'Renewal reminders',
        description: 'Alerts on subscription renewal days',
        importance: Importance.defaultImportance,
      ),
    );
  }

  Future<void> _requestPlatformPermissions() async {
    final AndroidFlutterLocalNotificationsPlugin? android = _plugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await android?.requestNotificationsPermission();

    final IOSFlutterLocalNotificationsPlugin? ios = _plugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>();
    await ios?.requestPermissions(alert: true, badge: true, sound: true);

    final MacOSFlutterLocalNotificationsPlugin? mac = _plugin
        .resolvePlatformSpecificImplementation<MacOSFlutterLocalNotificationsPlugin>();
    await mac?.requestPermissions(alert: true, badge: true, sound: true);
  }

  @override
  Future<void> resync(List<Subscription> subscriptions) async {
    if (kIsWeb) {
      return;
    }
    await _plugin.cancelAll();
    for (final Subscription s in subscriptions) {
      await _scheduleOne(s);
    }
  }

  Future<void> _scheduleOne(Subscription s) async {
    final tz.TZDateTime when = tz.TZDateTime(
      tz.local,
      s.nextRenewal.year,
      s.nextRenewal.month,
      s.nextRenewal.day,
      9,
    );
    if (!when.isAfter(tz.TZDateTime.now(tz.local))) {
      return;
    }
    final String lang =
        WidgetsBinding.instance.platformDispatcher.locale.languageCode;
    final String amount = NumberFormat.currency(symbol: r'$').format(s.amount);
    final String title = lang == 'ar' ? 'تجديد قريب' : 'Renewal coming up';
    final String body = lang == 'ar'
        ? '«${s.name}» يتجدد اليوم ($amount).'
        : '${s.name} renews today ($amount).';

    final NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails(
        _androidChannelId,
        'Renewal reminders',
        channelDescription: 'Alerts on subscription renewal days',
        importance: Importance.defaultImportance,
      ),
      iOS: const DarwinNotificationDetails(),
      macOS: const DarwinNotificationDetails(),
    );

    await _plugin.zonedSchedule(
      _notificationIdFor(s.id),
      title,
      body,
      when,
      details,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  int _notificationIdFor(String subscriptionId) {
    return subscriptionId.hashCode & 0x7fffffff;
  }
}
