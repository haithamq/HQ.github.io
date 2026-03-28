// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'بصيرة';

  @override
  String get landingSignIn => 'تسجيل الدخول';

  @override
  String get landingContinueGuest => 'متابعة بدون حساب';

  @override
  String get loginTitle => 'تسجيل الدخول';

  @override
  String get loginSubtitle =>
      'سجّل ببريدك الإلكتروني. يمكن ربط الخادم لاحقًا — حاليًا يفتح التطبيق محليًا على جهازك.';

  @override
  String get loginEmailLabel => 'البريد الإلكتروني';

  @override
  String get loginPasswordLabel => 'كلمة المرور';

  @override
  String get loginSubmit => 'دخول';

  @override
  String get loginBackendNote =>
      'وضع تجريبي: لا يوجد خادم بعد. بياناتك تبقى على هذا الجهاز.';

  @override
  String get validatorEmail => 'أدخل البريد الإلكتروني';

  @override
  String get validatorEmailFormat => 'أدخل بريدًا صالحًا';

  @override
  String get validatorPassword => 'أدخل كلمة المرور';

  @override
  String get validatorPasswordLength => 'ستة أحرف على الأقل';

  @override
  String get settingsSignOut => 'تسجيل الخروج';

  @override
  String get tagline => 'تحكّم باشتراكاتك';

  @override
  String get heroDescription =>
      'تتبّع التجديدات والمصاريف الدورية — دون ربط حسابك البنكي أو جداول معقّدة.';

  @override
  String get loadError => 'تعذّر تحميل الاشتراكات.';

  @override
  String get addFab => 'إضافة';

  @override
  String get monthlyOutlook => 'المتوقّع شهريًا';

  @override
  String approxPerYear(String amount) {
    return '~ $amount / سنة (بعد التسوية)';
  }

  @override
  String get upcomingRenewals => 'التجديدات القادمة';

  @override
  String get renewalToday => 'اليوم';

  @override
  String get renewalTomorrow => 'غدًا';

  @override
  String renewalInDays(int days) {
    return 'خلال $days أيام';
  }

  @override
  String renewalDaysAgo(int days) {
    return 'منذ $days يومًا';
  }

  @override
  String get perMonthEquiv => '/شهريًا مكافئ';

  @override
  String get emptyTitle => 'لا يوجد شيء مُتتبَّع بعد';

  @override
  String get emptyBody =>
      'أضف الخدمات التي تدفع ثمنها — حتى لا تفاجئك التجديدات.';

  @override
  String get emptyCta => 'إضافة اشتراك';

  @override
  String get editSubscription => 'تعديل الاشتراك';

  @override
  String get addSubscription => 'إضافة اشتراك';

  @override
  String get deleteTooltip => 'حذف';

  @override
  String get serviceName => 'اسم الخدمة';

  @override
  String get serviceNameHint => 'مثل: نتفليكس، نادي رياضي، تخزين سحابي';

  @override
  String get validatorName => 'أدخل الاسم';

  @override
  String get amountLabel => 'المبلغ';

  @override
  String get validatorAmount => 'أدخل المبلغ';

  @override
  String get validatorAmountPositive => 'استخدم رقمًا موجبًا';

  @override
  String get billingCycle => 'دورة الفوترة';

  @override
  String get nextRenewal => 'التجديد التالي';

  @override
  String get categoryOptional => 'التصنيف (اختياري)';

  @override
  String get categoryHint => 'بث، إنتاجية، صحة…';

  @override
  String get saveChanges => 'حفظ التغييرات';

  @override
  String get saveSubscription => 'حفظ الاشتراك';

  @override
  String get confirmDeleteTitle => 'إزالة الاشتراك؟';

  @override
  String confirmDeleteBody(String name) {
    return 'سيتم إزالة «$name» من بصيرة.';
  }

  @override
  String get cancel => 'إلغاء';

  @override
  String get deleteAction => 'حذف';

  @override
  String get billingWeekly => 'أسبوعي';

  @override
  String get billingMonthly => 'شهري';

  @override
  String get billingQuarterly => 'ربع سنوي';

  @override
  String get billingYearly => 'سنوي';

  @override
  String get renewalReminderTitle => 'تجديد قريب';

  @override
  String renewalReminderBody(String name, String amount) {
    return '«$name» يتجدد اليوم ($amount).';
  }

  @override
  String get tabHome => 'الرئيسية';

  @override
  String get tabAllSubs => 'كل الاشتراكات';

  @override
  String get tabTrialRadar => 'التجارب';

  @override
  String get tabInsights => 'رؤية';

  @override
  String get tabSettings => 'الإعدادات';

  @override
  String get rtlBanner => 'بصيرة · دعم RTL وLTR';

  @override
  String get greetMorning => 'صباح الخير';

  @override
  String get greetAfternoon => 'مساء الخير';

  @override
  String get greetEvening => 'مساء الخير';

  @override
  String greetNameClause(String name) {
    return '، $name';
  }

  @override
  String activeCount(int count) {
    return '$count اشتراك نشط';
  }

  @override
  String get statMonthlyTotal => 'الإجمالي الشهري';

  @override
  String get statDueThisWeek => 'مستحق هذا الأسبوع';

  @override
  String get statAnnualProjection => 'تقدير سنوي';

  @override
  String get statInsightsWaiting => 'رؤى في الانتظار';

  @override
  String get addSubscriptionSubtitle => 'إدخال يدوي — مسح البريد قريبًا';

  @override
  String get currency => 'العملة';

  @override
  String get categoryStreaming => 'بث';

  @override
  String get categoryMusic => 'موسيقى';

  @override
  String get categoryProductivity => 'إنتاجية';

  @override
  String get categoryCloud => 'سحابة';

  @override
  String get categoryOther => 'أخرى';

  @override
  String get isFreeTrial => 'هل هذه فترة تجريبية؟';

  @override
  String get trialEnds => 'نهاية التجربة';

  @override
  String get yes => 'نعم';

  @override
  String get no => 'لا';

  @override
  String get validatorTrialEnd => 'اختر تاريخ نهاية التجربة';

  @override
  String get insightsScreenTitle => 'رؤيتك';

  @override
  String insightsScreenSubtitle(int count) {
    return '$count رؤى ذكية · محدّث اليوم';
  }

  @override
  String get insightsEmpty =>
      'أضف بعض الاشتراكات — سنُظهر التداخلات والتجارب والتوفير هنا.';

  @override
  String insightOverlap(String category) {
    return 'تداخل في $category';
  }

  @override
  String get insightTrial => 'تجربة تنتهي قريبًا لإحدى خدماتك';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get settingsCurrency => 'العملة الافتراضية';

  @override
  String get settingsDisplayName => 'كيف نناديك؟';

  @override
  String get settingsDisplayNameHint => 'أحمد';

  @override
  String get settingsSaveProfile => 'حفظ';

  @override
  String get settingsProfileUpdated => 'تم الحفظ';

  @override
  String get allSubscriptionsTitle => 'كل الاشتراكات';

  @override
  String renewsLine(String date, String cycle) {
    return 'يتجدد $date · $cycle';
  }

  @override
  String get trialRadarTitle => 'رادار التجربة';

  @override
  String trialRadarSubtitle(int count) {
    return '$count تجارب نشطة';
  }

  @override
  String get trialRadarEmpty =>
      'لا توجد تجارب نشطة. أضف اشتراكًا وحدّده كتجربة مجانية ليظهر هنا.';

  @override
  String trialDaysLeft(int days) {
    return '$daysي';
  }

  @override
  String trialChargeLine(String amount, String date, String cycle) {
    return '$amount · يتجدد $date · $cycle';
  }

  @override
  String get cancelGuide => 'دليل الإلغاء';

  @override
  String get cancelGuideSoon => 'دليل إلغاء خطوة بخطوة قادم قريبًا.';

  @override
  String get familyWorkspaceTitle => 'مساحة العائلة';

  @override
  String get familyWorkspaceSettingsSubtitle =>
      'تقسيم التكاليف والخطط المشتركة';

  @override
  String familyWorkspaceSubtitle(int count, String total) {
    return '$count أشخاص · إجمالي الحصة $total/شهريًا';
  }

  @override
  String get familyYou => 'أنت';

  @override
  String familyMemberNumber(int number) {
    return 'عضو $number';
  }

  @override
  String get familyMemberNameLabel => 'الاسم على الخطة';

  @override
  String familyMemberShareLabel(String currency) {
    return 'الحصة الشهرية ($currency)';
  }

  @override
  String get familySaveSplit => 'حفظ التقسيم';

  @override
  String get familySplitSaved => 'تم حفظ تقسيم المنزل';

  @override
  String get familySharedPlans => 'خطط مشتركة';

  @override
  String get familyNoSharedPlans => 'أضف ملاحظة مشاركة على اشتراك لعرضه هنا.';

  @override
  String get sharingNoteLabel => 'ملاحظة المشاركة';

  @override
  String get sharingNoteHint => 'مثل: أحمد وفاطمة · 3 شاشات';
}
