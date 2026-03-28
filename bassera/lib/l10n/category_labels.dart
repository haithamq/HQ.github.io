import 'package:baseera/l10n/app_localizations.dart';

extension SubscriptionCategoryL10n on String? {
  String labelIn(AppLocalizations l10n) {
    switch (this) {
      case 'streaming':
        return l10n.categoryStreaming;
      case 'music':
        return l10n.categoryMusic;
      case 'productivity':
        return l10n.categoryProductivity;
      case 'cloud':
        return l10n.categoryCloud;
      case 'other':
        return l10n.categoryOther;
      case null:
      case '':
        return l10n.categoryOther;
      default:
        return this!;
    }
  }
}
