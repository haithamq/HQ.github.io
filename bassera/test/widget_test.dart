import 'package:baseera/app/baseera_app.dart';
import 'package:baseera/data/subscription_repository.dart';
import 'package:baseera/models/app_settings.dart';
import 'package:baseera/models/subscription.dart';
import 'package:baseera/notifications/renewal_reminder_backend.dart';
import 'package:baseera/providers/app_settings_provider.dart';
import 'package:baseera/providers/session_provider.dart';
import 'package:baseera/providers/subscriptions_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class _FakeSubscriptionRepository implements SubscriptionRepository {
  @override
  Future<List<Subscription>> load() async => <Subscription>[];

  @override
  Future<void> save(List<Subscription> items) async {}
}

class _FakeAppSettings extends AppSettingsNotifier {
  @override
  Future<AppSettings> build() async => const AppSettings(
        currencyCode: 'AED',
        displayName: '',
      );
}

class _FakeSessionNotifier extends SessionNotifier {
  @override
  Future<bool> build() async => true;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Baseera shell renders (Arabic)', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: <Override>[
          subscriptionRepositoryProvider.overrideWithValue(_FakeSubscriptionRepository()),
          renewalReminderBackendProvider.overrideWithValue(NoopRenewalReminderBackend()),
          appSettingsProvider.overrideWith(_FakeAppSettings.new),
          sessionProvider.overrideWith(_FakeSessionNotifier.new),
        ],
        child: const Directionality(
          textDirection: TextDirection.rtl,
          child: BaseeraApp(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('الرئيسية'), findsOneWidget);
    expect(find.textContaining('بصيرة'), findsWidgets);
  });
}
