import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Baseera'**
  String get appTitle;

  /// No description provided for @landingSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get landingSignIn;

  /// No description provided for @landingContinueGuest.
  ///
  /// In en, this message translates to:
  /// **'Continue without account'**
  String get landingContinueGuest;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get loginTitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Use your email to sign in. Backend auth can plug in here later — for now this unlocks the app locally.'**
  String get loginSubtitle;

  /// No description provided for @loginEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get loginEmailLabel;

  /// No description provided for @loginPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginPasswordLabel;

  /// No description provided for @loginSubmit.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get loginSubmit;

  /// No description provided for @loginBackendNote.
  ///
  /// In en, this message translates to:
  /// **'Demo mode: no server yet. Your data stays on this device.'**
  String get loginBackendNote;

  /// No description provided for @validatorEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get validatorEmail;

  /// No description provided for @validatorEmailFormat.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get validatorEmailFormat;

  /// No description provided for @validatorPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get validatorPassword;

  /// No description provided for @validatorPasswordLength.
  ///
  /// In en, this message translates to:
  /// **'Use at least 6 characters'**
  String get validatorPasswordLength;

  /// No description provided for @settingsSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get settingsSignOut;

  /// No description provided for @tagline.
  ///
  /// In en, this message translates to:
  /// **'Master your subscriptions'**
  String get tagline;

  /// No description provided for @heroDescription.
  ///
  /// In en, this message translates to:
  /// **'Track renewals and recurring spend — without linking your bank or living in a spreadsheet.'**
  String get heroDescription;

  /// No description provided for @loadError.
  ///
  /// In en, this message translates to:
  /// **'Could not load subscriptions.'**
  String get loadError;

  /// No description provided for @addFab.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get addFab;

  /// No description provided for @monthlyOutlook.
  ///
  /// In en, this message translates to:
  /// **'Monthly outlook'**
  String get monthlyOutlook;

  /// No description provided for @approxPerYear.
  ///
  /// In en, this message translates to:
  /// **'~ {amount} / year (normalized)'**
  String approxPerYear(String amount);

  /// No description provided for @upcomingRenewals.
  ///
  /// In en, this message translates to:
  /// **'Upcoming renewals'**
  String get upcomingRenewals;

  /// No description provided for @renewalToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get renewalToday;

  /// No description provided for @renewalTomorrow.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow'**
  String get renewalTomorrow;

  /// No description provided for @renewalInDays.
  ///
  /// In en, this message translates to:
  /// **'In {days} days'**
  String renewalInDays(int days);

  /// No description provided for @renewalDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'{days}d ago'**
  String renewalDaysAgo(int days);

  /// No description provided for @perMonthEquiv.
  ///
  /// In en, this message translates to:
  /// **'/mo eq.'**
  String get perMonthEquiv;

  /// No description provided for @emptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Nothing tracked yet'**
  String get emptyTitle;

  /// No description provided for @emptyBody.
  ///
  /// In en, this message translates to:
  /// **'Add the services you pay for — so renewals never surprise you.'**
  String get emptyBody;

  /// No description provided for @emptyCta.
  ///
  /// In en, this message translates to:
  /// **'Add subscription'**
  String get emptyCta;

  /// No description provided for @editSubscription.
  ///
  /// In en, this message translates to:
  /// **'Edit subscription'**
  String get editSubscription;

  /// No description provided for @addSubscription.
  ///
  /// In en, this message translates to:
  /// **'Add subscription'**
  String get addSubscription;

  /// No description provided for @deleteTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteTooltip;

  /// No description provided for @serviceName.
  ///
  /// In en, this message translates to:
  /// **'Service name'**
  String get serviceName;

  /// No description provided for @serviceNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Netflix, Gym, Cloud storage'**
  String get serviceNameHint;

  /// No description provided for @validatorName.
  ///
  /// In en, this message translates to:
  /// **'Enter a name'**
  String get validatorName;

  /// No description provided for @amountLabel.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amountLabel;

  /// No description provided for @validatorAmount.
  ///
  /// In en, this message translates to:
  /// **'Enter an amount'**
  String get validatorAmount;

  /// No description provided for @validatorAmountPositive.
  ///
  /// In en, this message translates to:
  /// **'Use a positive number'**
  String get validatorAmountPositive;

  /// No description provided for @billingCycle.
  ///
  /// In en, this message translates to:
  /// **'Billing cycle'**
  String get billingCycle;

  /// No description provided for @nextRenewal.
  ///
  /// In en, this message translates to:
  /// **'Next renewal'**
  String get nextRenewal;

  /// No description provided for @categoryOptional.
  ///
  /// In en, this message translates to:
  /// **'Category (optional)'**
  String get categoryOptional;

  /// No description provided for @categoryHint.
  ///
  /// In en, this message translates to:
  /// **'Streaming, Productivity, Health…'**
  String get categoryHint;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get saveChanges;

  /// No description provided for @saveSubscription.
  ///
  /// In en, this message translates to:
  /// **'Save subscription'**
  String get saveSubscription;

  /// No description provided for @confirmDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove subscription?'**
  String get confirmDeleteTitle;

  /// No description provided for @confirmDeleteBody.
  ///
  /// In en, this message translates to:
  /// **'“{name}” will be removed from Baseera.'**
  String confirmDeleteBody(String name);

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @deleteAction.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteAction;

  /// No description provided for @billingWeekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get billingWeekly;

  /// No description provided for @billingMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get billingMonthly;

  /// No description provided for @billingQuarterly.
  ///
  /// In en, this message translates to:
  /// **'Quarterly'**
  String get billingQuarterly;

  /// No description provided for @billingYearly.
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get billingYearly;

  /// No description provided for @renewalReminderTitle.
  ///
  /// In en, this message translates to:
  /// **'Renewal coming up'**
  String get renewalReminderTitle;

  /// No description provided for @renewalReminderBody.
  ///
  /// In en, this message translates to:
  /// **'{name} renews today ({amount}).'**
  String renewalReminderBody(String name, String amount);

  /// No description provided for @tabHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get tabHome;

  /// No description provided for @tabAllSubs.
  ///
  /// In en, this message translates to:
  /// **'All subs'**
  String get tabAllSubs;

  /// No description provided for @tabTrialRadar.
  ///
  /// In en, this message translates to:
  /// **'Trials'**
  String get tabTrialRadar;

  /// No description provided for @tabInsights.
  ///
  /// In en, this message translates to:
  /// **'Insights'**
  String get tabInsights;

  /// No description provided for @tabSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get tabSettings;

  /// No description provided for @rtlBanner.
  ///
  /// In en, this message translates to:
  /// **'Baseera · RTL + LTR native'**
  String get rtlBanner;

  /// No description provided for @greetMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get greetMorning;

  /// No description provided for @greetAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get greetAfternoon;

  /// No description provided for @greetEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get greetEvening;

  /// No description provided for @greetNameClause.
  ///
  /// In en, this message translates to:
  /// **', {name}'**
  String greetNameClause(String name);

  /// No description provided for @activeCount.
  ///
  /// In en, this message translates to:
  /// **'{count} active subscriptions'**
  String activeCount(int count);

  /// No description provided for @statMonthlyTotal.
  ///
  /// In en, this message translates to:
  /// **'Monthly total'**
  String get statMonthlyTotal;

  /// No description provided for @statDueThisWeek.
  ///
  /// In en, this message translates to:
  /// **'Due this week'**
  String get statDueThisWeek;

  /// No description provided for @statAnnualProjection.
  ///
  /// In en, this message translates to:
  /// **'Annual projection'**
  String get statAnnualProjection;

  /// No description provided for @statInsightsWaiting.
  ///
  /// In en, this message translates to:
  /// **'Insights waiting'**
  String get statInsightsWaiting;

  /// No description provided for @addSubscriptionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manual entry — scan email coming soon'**
  String get addSubscriptionSubtitle;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currency;

  /// No description provided for @categoryStreaming.
  ///
  /// In en, this message translates to:
  /// **'Streaming'**
  String get categoryStreaming;

  /// No description provided for @categoryMusic.
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get categoryMusic;

  /// No description provided for @categoryProductivity.
  ///
  /// In en, this message translates to:
  /// **'Productivity'**
  String get categoryProductivity;

  /// No description provided for @categoryCloud.
  ///
  /// In en, this message translates to:
  /// **'Cloud'**
  String get categoryCloud;

  /// No description provided for @categoryOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get categoryOther;

  /// No description provided for @isFreeTrial.
  ///
  /// In en, this message translates to:
  /// **'Is this a free trial?'**
  String get isFreeTrial;

  /// No description provided for @trialEnds.
  ///
  /// In en, this message translates to:
  /// **'Trial ends'**
  String get trialEnds;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @validatorTrialEnd.
  ///
  /// In en, this message translates to:
  /// **'Pick when the trial ends'**
  String get validatorTrialEnd;

  /// No description provided for @insightsScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Your vision'**
  String get insightsScreenTitle;

  /// No description provided for @insightsScreenSubtitle.
  ///
  /// In en, this message translates to:
  /// **'{count} smart insights · updated today'**
  String insightsScreenSubtitle(int count);

  /// No description provided for @insightsEmpty.
  ///
  /// In en, this message translates to:
  /// **'Add a few subscriptions — we’ll surface overlaps, trials, and savings here.'**
  String get insightsEmpty;

  /// No description provided for @insightOverlap.
  ///
  /// In en, this message translates to:
  /// **'Overlap in {category}'**
  String insightOverlap(String category);

  /// No description provided for @insightTrial.
  ///
  /// In en, this message translates to:
  /// **'Trial ending soon for one of your services'**
  String get insightTrial;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsCurrency.
  ///
  /// In en, this message translates to:
  /// **'Default currency'**
  String get settingsCurrency;

  /// No description provided for @settingsDisplayName.
  ///
  /// In en, this message translates to:
  /// **'What should we call you?'**
  String get settingsDisplayName;

  /// No description provided for @settingsDisplayNameHint.
  ///
  /// In en, this message translates to:
  /// **'Ahmed'**
  String get settingsDisplayNameHint;

  /// No description provided for @settingsSaveProfile.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get settingsSaveProfile;

  /// No description provided for @settingsProfileUpdated.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get settingsProfileUpdated;

  /// No description provided for @allSubscriptionsTitle.
  ///
  /// In en, this message translates to:
  /// **'All subscriptions'**
  String get allSubscriptionsTitle;

  /// No description provided for @renewsLine.
  ///
  /// In en, this message translates to:
  /// **'Renews {date} · {cycle}'**
  String renewsLine(String date, String cycle);

  /// No description provided for @trialRadarTitle.
  ///
  /// In en, this message translates to:
  /// **'Trial radar'**
  String get trialRadarTitle;

  /// No description provided for @trialRadarSubtitle.
  ///
  /// In en, this message translates to:
  /// **'{count} active trials'**
  String trialRadarSubtitle(int count);

  /// No description provided for @trialRadarEmpty.
  ///
  /// In en, this message translates to:
  /// **'No active trials. Add a subscription and mark it as a free trial to see it here.'**
  String get trialRadarEmpty;

  /// No description provided for @trialDaysLeft.
  ///
  /// In en, this message translates to:
  /// **'{days}d'**
  String trialDaysLeft(int days);

  /// No description provided for @trialChargeLine.
  ///
  /// In en, this message translates to:
  /// **'{amount} · renews {date} · {cycle}'**
  String trialChargeLine(String amount, String date, String cycle);

  /// No description provided for @cancelGuide.
  ///
  /// In en, this message translates to:
  /// **'Cancel guide'**
  String get cancelGuide;

  /// No description provided for @cancelGuideSoon.
  ///
  /// In en, this message translates to:
  /// **'Step-by-step cancel guide is coming soon.'**
  String get cancelGuideSoon;

  /// No description provided for @familyWorkspaceTitle.
  ///
  /// In en, this message translates to:
  /// **'Family workspace'**
  String get familyWorkspaceTitle;

  /// No description provided for @familyWorkspaceSettingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Split costs and shared plans'**
  String get familyWorkspaceSettingsSubtitle;

  /// No description provided for @familyWorkspaceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'{count} people · {total}/mo share'**
  String familyWorkspaceSubtitle(int count, String total);

  /// No description provided for @familyYou.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get familyYou;

  /// No description provided for @familyMemberNumber.
  ///
  /// In en, this message translates to:
  /// **'Member {number}'**
  String familyMemberNumber(int number);

  /// No description provided for @familyMemberNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name on plan'**
  String get familyMemberNameLabel;

  /// No description provided for @familyMemberShareLabel.
  ///
  /// In en, this message translates to:
  /// **'Monthly share ({currency})'**
  String familyMemberShareLabel(String currency);

  /// No description provided for @familySaveSplit.
  ///
  /// In en, this message translates to:
  /// **'Save split'**
  String get familySaveSplit;

  /// No description provided for @familySplitSaved.
  ///
  /// In en, this message translates to:
  /// **'Household split saved'**
  String get familySplitSaved;

  /// No description provided for @familySharedPlans.
  ///
  /// In en, this message translates to:
  /// **'Shared plans'**
  String get familySharedPlans;

  /// No description provided for @familyNoSharedPlans.
  ///
  /// In en, this message translates to:
  /// **'Add a sharing note on a subscription to list it here.'**
  String get familyNoSharedPlans;

  /// No description provided for @sharingNoteLabel.
  ///
  /// In en, this message translates to:
  /// **'Sharing note'**
  String get sharingNoteLabel;

  /// No description provided for @sharingNoteHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Ahmed & Fatima · 3 screens'**
  String get sharingNoteHint;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
