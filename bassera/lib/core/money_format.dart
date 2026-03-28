import 'package:intl/intl.dart';

/// Formats money using [currencyCode] (ISO 4217) and UI [localeName].
NumberFormat moneyFormatter({
  required String currencyCode,
  required String localeName,
}) {
  return NumberFormat.simpleCurrency(
    name: currencyCode,
    locale: localeName,
  );
}
