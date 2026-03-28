import 'package:baseera/data/isar_service.dart';
import 'package:baseera/data/isar_subscription_repository.dart';
import 'package:baseera/data/legacy_prefs_subscription_migrator.dart';
import 'package:baseera/data/subscription_repository.dart';

Future<SubscriptionRepository> createSubscriptionRepository() async {
  final isar = await IsarService.instance();
  await LegacyPrefsSubscriptionMigrator.migrateIfNeeded(isar);
  return IsarSubscriptionRepository(isar);
}
