import 'package:baseera/models/app_settings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final appSettingsProvider =
    AsyncNotifierProvider<AppSettingsNotifier, AppSettings>(
  AppSettingsNotifier.new,
);

class AppSettingsNotifier extends AsyncNotifier<AppSettings> {
  static const String _kCurrency = 'baseera.settings.currency';
  static const String _kDisplayName = 'baseera.settings.display_name';

  static const List<String> supportedCurrencies = <String>[
    'AED',
    'SAR',
    'EGP',
    'KWD',
    'USD',
    'EUR',
  ];

  @override
  Future<AppSettings> build() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String currency =
        prefs.getString(_kCurrency) ?? supportedCurrencies.first;
    final String safeCurrency =
        supportedCurrencies.contains(currency) ? currency : 'AED';
    return AppSettings(
      currencyCode: safeCurrency,
      displayName: prefs.getString(_kDisplayName) ?? '',
    );
  }

  Future<void> setCurrencyCode(String code) async {
    if (!supportedCurrencies.contains(code)) {
      return;
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kCurrency, code);
    final AppSettings cur = state.requireValue;
    state = AsyncData<AppSettings>(cur.copyWith(currencyCode: code));
  }

  Future<void> setDisplayName(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kDisplayName, name);
    final AppSettings cur = state.requireValue;
    state = AsyncData<AppSettings>(cur.copyWith(displayName: name));
  }
}
