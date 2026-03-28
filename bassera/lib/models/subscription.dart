import 'package:baseera/models/billing_cycle.dart';

class Subscription {
  const Subscription({
    required this.id,
    required this.name,
    required this.amount,
    required this.billingCycle,
    required this.nextRenewal,
    this.category,
    this.isFreeTrial = false,
    this.trialEndsAt,
    this.sharingNote,
  });

  final String id;
  final String name;
  final double amount;
  final BillingCycle billingCycle;
  final DateTime nextRenewal;
  final String? category;

  /// True when user marked this row as an active free trial.
  final bool isFreeTrial;

  /// Last day (or charge day) of the trial — optional.
  final DateTime? trialEndsAt;

  /// Optional note for family/shared plans (shown on Family workspace).
  final String? sharingNote;

  /// Normalized to a monthly figure for totals and comparisons.
  double get monthlyEquivalent {
    switch (billingCycle) {
      case BillingCycle.weekly:
        return amount * 52 / 12;
      case BillingCycle.monthly:
        return amount;
      case BillingCycle.quarterly:
        return amount / 3;
      case BillingCycle.yearly:
        return amount / 12;
    }
  }

  Subscription copyWith({
    String? id,
    String? name,
    double? amount,
    BillingCycle? billingCycle,
    DateTime? nextRenewal,
    String? category,
    bool? isFreeTrial,
    DateTime? trialEndsAt,
    String? sharingNote,
    bool clearCategory = false,
    bool clearTrialEndsAt = false,
    bool clearSharingNote = false,
  }) {
    return Subscription(
      id: id ?? this.id,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      billingCycle: billingCycle ?? this.billingCycle,
      nextRenewal: nextRenewal ?? this.nextRenewal,
      category: clearCategory ? null : (category ?? this.category),
      isFreeTrial: isFreeTrial ?? this.isFreeTrial,
      trialEndsAt:
          clearTrialEndsAt ? null : (trialEndsAt ?? this.trialEndsAt),
      sharingNote:
          clearSharingNote ? null : (sharingNote ?? this.sharingNote),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'amount': amount,
      'billingCycle': billingCycle.name,
      'nextRenewal': nextRenewal.toIso8601String(),
      'category': category,
      'isFreeTrial': isFreeTrial,
      'trialEndsAt': trialEndsAt?.toIso8601String(),
      'sharingNote': sharingNote,
    };
  }

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      id: json['id'] as String,
      name: json['name'] as String,
      amount: (json['amount'] as num).toDouble(),
      billingCycle: BillingCycle.fromJson(json['billingCycle'] as String),
      nextRenewal: DateTime.parse(json['nextRenewal'] as String),
      category: json['category'] as String?,
      isFreeTrial: json['isFreeTrial'] as bool? ?? false,
      trialEndsAt: json['trialEndsAt'] != null
          ? DateTime.parse(json['trialEndsAt'] as String)
          : null,
      sharingNote: json['sharingNote'] as String?,
    );
  }
}

extension SubscriptionListMonthly on Iterable<Subscription> {
  double get totalMonthlyEquivalent =>
      fold<double>(0, (double sum, Subscription s) => sum + s.monthlyEquivalent);
}

extension SubscriptionDueThisWeek on Subscription {
  /// Renewal date within the next 7 days from today (inclusive).
  bool get renewsWithinWeek {
    final DateTime today = DateTime.now();
    final DateTime t = DateTime(today.year, today.month, today.day);
    final DateTime d =
        DateTime(nextRenewal.year, nextRenewal.month, nextRenewal.day);
    final int diff = d.difference(t).inDays;
    return diff >= 0 && diff <= 7;
  }
}
