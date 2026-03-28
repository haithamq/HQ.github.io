import 'package:baseera/models/subscription.dart';

/// Schedules local notifications for subscription renewal days.
abstract class RenewalReminderBackend {
  Future<void> init();

  Future<void> resync(List<Subscription> subscriptions);
}

/// No-op (web, tests, or disabled builds).
class NoopRenewalReminderBackend implements RenewalReminderBackend {
  @override
  Future<void> init() async {}

  @override
  Future<void> resync(List<Subscription> subscriptions) async {}
}
