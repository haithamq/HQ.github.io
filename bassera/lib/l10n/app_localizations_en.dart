// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Baseera';

  @override
  String get landingSignIn => 'Sign in';

  @override
  String get landingContinueGuest => 'Continue without account';

  @override
  String get loginTitle => 'Sign in';

  @override
  String get loginSubtitle =>
      'Use your email to sign in. Backend auth can plug in here later — for now this unlocks the app locally.';

  @override
  String get loginEmailLabel => 'Email';

  @override
  String get loginPasswordLabel => 'Password';

  @override
  String get loginSubmit => 'Sign in';

  @override
  String get loginBackendNote =>
      'Demo mode: no server yet. Your data stays on this device.';

  @override
  String get validatorEmail => 'Enter your email';

  @override
  String get validatorEmailFormat => 'Enter a valid email';

  @override
  String get validatorPassword => 'Enter your password';

  @override
  String get validatorPasswordLength => 'Use at least 6 characters';

  @override
  String get settingsSignOut => 'Sign out';

  @override
  String get tagline => 'Master your subscriptions';

  @override
  String get heroDescription =>
      'Track renewals and recurring spend — without linking your bank or living in a spreadsheet.';

  @override
  String get loadError => 'Could not load subscriptions.';

  @override
  String get addFab => 'Add';

  @override
  String get monthlyOutlook => 'Monthly outlook';

  @override
  String approxPerYear(String amount) {
    return '~ $amount / year (normalized)';
  }

  @override
  String get upcomingRenewals => 'Upcoming renewals';

  @override
  String get renewalToday => 'Today';

  @override
  String get renewalTomorrow => 'Tomorrow';

  @override
  String renewalInDays(int days) {
    return 'In $days days';
  }

  @override
  String renewalDaysAgo(int days) {
    return '${days}d ago';
  }

  @override
  String get perMonthEquiv => '/mo eq.';

  @override
  String get emptyTitle => 'Nothing tracked yet';

  @override
  String get emptyBody =>
      'Add the services you pay for — so renewals never surprise you.';

  @override
  String get emptyCta => 'Add subscription';

  @override
  String get editSubscription => 'Edit subscription';

  @override
  String get addSubscription => 'Add subscription';

  @override
  String get deleteTooltip => 'Delete';

  @override
  String get serviceName => 'Service name';

  @override
  String get serviceNameHint => 'e.g. Netflix, Gym, Cloud storage';

  @override
  String get validatorName => 'Enter a name';

  @override
  String get amountLabel => 'Amount';

  @override
  String get validatorAmount => 'Enter an amount';

  @override
  String get validatorAmountPositive => 'Use a positive number';

  @override
  String get billingCycle => 'Billing cycle';

  @override
  String get nextRenewal => 'Next renewal';

  @override
  String get categoryOptional => 'Category (optional)';

  @override
  String get categoryHint => 'Streaming, Productivity, Health…';

  @override
  String get saveChanges => 'Save changes';

  @override
  String get saveSubscription => 'Save subscription';

  @override
  String get confirmDeleteTitle => 'Remove subscription?';

  @override
  String confirmDeleteBody(String name) {
    return '“$name” will be removed from Baseera.';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get deleteAction => 'Delete';

  @override
  String get billingWeekly => 'Weekly';

  @override
  String get billingMonthly => 'Monthly';

  @override
  String get billingQuarterly => 'Quarterly';

  @override
  String get billingYearly => 'Yearly';

  @override
  String get renewalReminderTitle => 'Renewal coming up';

  @override
  String renewalReminderBody(String name, String amount) {
    return '$name renews today ($amount).';
  }

  @override
  String get tabHome => 'Home';

  @override
  String get tabAllSubs => 'All subs';

  @override
  String get tabTrialRadar => 'Trials';

  @override
  String get tabInsights => 'Insights';

  @override
  String get tabSettings => 'Settings';

  @override
  String get rtlBanner => 'Baseera · RTL + LTR native';

  @override
  String get greetMorning => 'Good morning';

  @override
  String get greetAfternoon => 'Good afternoon';

  @override
  String get greetEvening => 'Good evening';

  @override
  String greetNameClause(String name) {
    return ', $name';
  }

  @override
  String activeCount(int count) {
    return '$count active subscriptions';
  }

  @override
  String get statMonthlyTotal => 'Monthly total';

  @override
  String get statDueThisWeek => 'Due this week';

  @override
  String get statAnnualProjection => 'Annual projection';

  @override
  String get statInsightsWaiting => 'Insights waiting';

  @override
  String get addSubscriptionSubtitle => 'Manual entry — scan email coming soon';

  @override
  String get currency => 'Currency';

  @override
  String get categoryStreaming => 'Streaming';

  @override
  String get categoryMusic => 'Music';

  @override
  String get categoryProductivity => 'Productivity';

  @override
  String get categoryCloud => 'Cloud';

  @override
  String get categoryOther => 'Other';

  @override
  String get isFreeTrial => 'Is this a free trial?';

  @override
  String get trialEnds => 'Trial ends';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get validatorTrialEnd => 'Pick when the trial ends';

  @override
  String get insightsScreenTitle => 'Your vision';

  @override
  String insightsScreenSubtitle(int count) {
    return '$count smart insights · updated today';
  }

  @override
  String get insightsEmpty =>
      'Add a few subscriptions — we’ll surface overlaps, trials, and savings here.';

  @override
  String insightOverlap(String category) {
    return 'Overlap in $category';
  }

  @override
  String get insightTrial => 'Trial ending soon for one of your services';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsCurrency => 'Default currency';

  @override
  String get settingsDisplayName => 'What should we call you?';

  @override
  String get settingsDisplayNameHint => 'Ahmed';

  @override
  String get settingsSaveProfile => 'Save';

  @override
  String get settingsProfileUpdated => 'Saved';

  @override
  String get allSubscriptionsTitle => 'All subscriptions';

  @override
  String renewsLine(String date, String cycle) {
    return 'Renews $date · $cycle';
  }

  @override
  String get trialRadarTitle => 'Trial radar';

  @override
  String trialRadarSubtitle(int count) {
    return '$count active trials';
  }

  @override
  String get trialRadarEmpty =>
      'No active trials. Add a subscription and mark it as a free trial to see it here.';

  @override
  String trialDaysLeft(int days) {
    return '${days}d';
  }

  @override
  String trialChargeLine(String amount, String date, String cycle) {
    return '$amount · renews $date · $cycle';
  }

  @override
  String get cancelGuide => 'Cancel guide';

  @override
  String get cancelGuideSoon => 'Step-by-step cancel guide is coming soon.';

  @override
  String get familyWorkspaceTitle => 'Family workspace';

  @override
  String get familyWorkspaceSettingsSubtitle => 'Split costs and shared plans';

  @override
  String familyWorkspaceSubtitle(int count, String total) {
    return '$count people · $total/mo share';
  }

  @override
  String get familyYou => 'You';

  @override
  String familyMemberNumber(int number) {
    return 'Member $number';
  }

  @override
  String get familyMemberNameLabel => 'Name on plan';

  @override
  String familyMemberShareLabel(String currency) {
    return 'Monthly share ($currency)';
  }

  @override
  String get familySaveSplit => 'Save split';

  @override
  String get familySplitSaved => 'Household split saved';

  @override
  String get familySharedPlans => 'Shared plans';

  @override
  String get familyNoSharedPlans =>
      'Add a sharing note on a subscription to list it here.';

  @override
  String get sharingNoteLabel => 'Sharing note';

  @override
  String get sharingNoteHint => 'e.g. Ahmed & Fatima · 3 screens';
}
