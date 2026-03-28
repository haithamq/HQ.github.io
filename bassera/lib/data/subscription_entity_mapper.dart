import 'package:baseera/data/subscription_entity.dart';
import 'package:baseera/models/billing_cycle.dart';
import 'package:baseera/models/subscription.dart';

Subscription subscriptionFromEntity(SubscriptionEntity e) {
  return Subscription(
    id: e.subscriptionId,
    name: e.name,
    amount: e.amount,
    billingCycle: BillingCycle.values[e.billingCycleIndex.clamp(0, BillingCycle.values.length - 1)],
    nextRenewal: e.nextRenewal,
    category: e.category,
    isFreeTrial: e.isFreeTrial,
    trialEndsAt: e.trialEndsAt,
    sharingNote: e.sharingNote,
  );
}

SubscriptionEntity subscriptionToEntity(Subscription s) {
  return SubscriptionEntity()
    ..subscriptionId = s.id
    ..name = s.name
    ..amount = s.amount
    ..billingCycleIndex = s.billingCycle.index
    ..nextRenewal = s.nextRenewal
    ..category = s.category
    ..isFreeTrial = s.isFreeTrial
    ..trialEndsAt = s.trialEndsAt
    ..sharingNote = s.sharingNote;
}
