import 'package:baseera/models/subscription.dart';

/// Local-first persistence for subscriptions (Isar on native, SharedPreferences on web).
abstract class SubscriptionRepository {
  Future<List<Subscription>> load();

  Future<void> save(List<Subscription> items);
}
