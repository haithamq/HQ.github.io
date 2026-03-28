enum BillingCycle {
  weekly,
  monthly,
  quarterly,
  yearly;

  String get label => switch (this) {
        BillingCycle.weekly => 'Weekly',
        BillingCycle.monthly => 'Monthly',
        BillingCycle.quarterly => 'Quarterly',
        BillingCycle.yearly => 'Yearly',
      };

  static BillingCycle fromJson(String value) {
    return BillingCycle.values.firstWhere(
      (BillingCycle e) => e.name == value,
      orElse: () => BillingCycle.monthly,
    );
  }
}
