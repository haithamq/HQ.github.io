import 'package:isar/isar.dart';

part 'subscription_entity.g.dart';

@collection
class SubscriptionEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String subscriptionId;

  late String name;

  late double amount;

  /// [BillingCycle.index]
  late int billingCycleIndex;

  late DateTime nextRenewal;

  String? category;

  bool isFreeTrial = false;

  DateTime? trialEndsAt;

  /// Household sharing line, e.g. "Ahmed, Fatima · 3 screens"
  String? sharingNote;
}
