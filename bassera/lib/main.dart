import 'package:baseera/app/baseera_app.dart';
import 'package:baseera/data/subscription_repository.dart';
import 'package:baseera/data/subscription_repository_factory.dart';
import 'package:baseera/notifications/live_renewal_reminder_backend.dart';
import 'package:baseera/notifications/renewal_reminder_backend.dart';
import 'package:baseera/providers/subscriptions_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SubscriptionRepository repository = await createSubscriptionRepository();

  final RenewalReminderBackend reminders = kIsWeb
      ? NoopRenewalReminderBackend()
      : LiveRenewalReminderBackend();
  await reminders.init();

  runApp(
    ProviderScope(
      overrides: <Override>[
        subscriptionRepositoryProvider.overrideWithValue(repository),
        renewalReminderBackendProvider.overrideWithValue(reminders),
      ],
      child: const Directionality(
        textDirection: TextDirection.rtl,
        child: BaseeraApp(),
      ),
    ),
  );
}
