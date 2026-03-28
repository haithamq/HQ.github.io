class AppSettings {
  const AppSettings({
    required this.currencyCode,
    required this.displayName,
  });

  final String currencyCode;
  final String displayName;

  AppSettings copyWith({
    String? currencyCode,
    String? displayName,
  }) {
    return AppSettings(
      currencyCode: currencyCode ?? this.currencyCode,
      displayName: displayName ?? this.displayName,
    );
  }
}
