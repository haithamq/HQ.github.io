import 'package:baseera/models/subscription.dart';

/// Local, zero-cost insight rules (overlap by category, etc.).
/// Cloud / Claude narratives can be layered on later for paid tier.
List<LocalInsight> generateLocalInsights(List<Subscription> subscriptions) {
  final List<LocalInsight> out = <LocalInsight>[];

  final Map<String, List<Subscription>> byCategory = <String, List<Subscription>>{};
  for (final Subscription s in subscriptions) {
    final String key = (s.category ?? 'other').trim().toLowerCase();
    if (key.isEmpty) {
      continue;
    }
    byCategory.putIfAbsent(key, () => <Subscription>[]).add(s);
  }

  for (final MapEntry<String, List<Subscription>> e in byCategory.entries) {
    if (e.value.length >= 2 && _overlapCategories.contains(e.key)) {
      out.add(LocalInsight.overlap(e.key));
    }
  }

  final List<Subscription> trials = subscriptions
      .where((Subscription s) => s.isFreeTrial && s.trialEndsAt != null)
      .toList();
  final DateTime now = DateTime.now();
  for (final Subscription s in trials) {
    final DateTime end = s.trialEndsAt!;
    if (!end.isBefore(DateTime(now.year, now.month, now.day))) {
      out.add(LocalInsight.trial(s.id));
    }
  }

  return out;
}

const Set<String> _overlapCategories = <String>{
  'streaming',
  'music',
  'cloud',
  'productivity',
};

enum LocalInsightType { overlap, trial }

class LocalInsight {
  const LocalInsight._(this.type, {this.categoryKey, this.subscriptionId});

  factory LocalInsight.overlap(String categoryKey) =>
      LocalInsight._(LocalInsightType.overlap, categoryKey: categoryKey);

  factory LocalInsight.trial(String subscriptionId) =>
      LocalInsight._(LocalInsightType.trial, subscriptionId: subscriptionId);

  final LocalInsightType type;
  final String? categoryKey;
  final String? subscriptionId;
}
