/// Bump this whenever [SubscriptionEntity] (Isar) fields change.
///
/// On upgrade, if the stored version is below this value, local `.isar` files are
/// deleted and the database is recreated (Isar does not auto-migrate schema changes).
/// [LegacyPrefsSubscriptionMigrator] may still repopulate from prefs if present.
const int kBaseeraIsarSchemaVersion = 3;
