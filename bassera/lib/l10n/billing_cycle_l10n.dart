import 'package:baseera/l10n/app_localizations.dart';
import 'package:baseera/models/billing_cycle.dart';

extension BillingCycleL10n on BillingCycle {
  String localizedLabel(AppLocalizations l10n) {
    switch (this) {
      case BillingCycle.weekly:
        return l10n.billingWeekly;
      case BillingCycle.monthly:
        return l10n.billingMonthly;
      case BillingCycle.quarterly:
        return l10n.billingQuarterly;
      case BillingCycle.yearly:
        return l10n.billingYearly;
    }
  }
}
