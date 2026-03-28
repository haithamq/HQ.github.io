import 'dart:convert';

import 'package:baseera/data/subscription_entity_mapper.dart';
import 'package:baseera/data/subscription_entity.dart';
import 'package:baseera/models/subscription.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// One-time import from SharedPreferences into Isar when Isar is empty.
class LegacyPrefsSubscriptionMigrator {
  static const String _key = 'baseera.subscriptions.v1';

  static Future<void> migrateIfNeeded(Isar isar) async {
    final int count = await isar.subscriptionEntitys.count();
    if (count > 0) {
      return;
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? raw = prefs.getString(_key);
    if (raw == null || raw.isEmpty) {
      return;
    }
    final List<dynamic> decoded = jsonDecode(raw) as List<dynamic>;
    final List<Subscription> items = decoded
        .map((dynamic e) => Subscription.fromJson(e as Map<String, dynamic>))
        .toList();
    await isar.writeTxn(() async {
      for (final Subscription s in items) {
        await isar.subscriptionEntitys.put(subscriptionToEntity(s));
      }
    });
    await prefs.remove(_key);
  }
}
