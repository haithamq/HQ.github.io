import 'dart:convert';

import 'package:baseera/data/subscription_repository.dart';
import 'package:baseera/models/subscription.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Web and fallback storage using SharedPreferences (JSON blob).
class PrefsSubscriptionRepository implements SubscriptionRepository {
  static const String _key = 'baseera.subscriptions.v1';

  @override
  Future<List<Subscription>> load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? raw = prefs.getString(_key);
    if (raw == null || raw.isEmpty) {
      return <Subscription>[];
    }
    final List<dynamic> decoded = jsonDecode(raw) as List<dynamic>;
    return decoded
        .map((dynamic e) => Subscription.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> save(List<Subscription> items) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String encoded =
        jsonEncode(items.map((Subscription e) => e.toJson()).toList());
    await prefs.setString(_key, encoded);
  }
}
