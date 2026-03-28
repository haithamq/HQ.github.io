import 'package:baseera/design_system/baseera_tokens.dart';
import 'package:baseera/domain/insight_engine.dart';
import 'package:baseera/l10n/app_localizations.dart';
import 'package:baseera/l10n/category_labels.dart' show SubscriptionCategoryL10n;
import 'package:baseera/models/subscription.dart';
import 'package:baseera/providers/subscriptions_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InsightsScreen extends ConsumerWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final AsyncValue<List<Subscription>> subs = ref.watch(subscriptionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.insightsScreenTitle),
      ),
      body: subs.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(child: Text(l10n.loadError)),
        data: (List<Subscription> list) {
          final List<LocalInsight> insights = generateLocalInsights(list);
          if (insights.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(BaseeraSpacing.xl),
                child: Text(
                  l10n.insightsEmpty,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            );
          }
          return ListView(
            padding: const EdgeInsetsDirectional.fromSTEB(
              BaseeraSpacing.md,
              BaseeraSpacing.sm,
              BaseeraSpacing.md,
              BaseeraSpacing.xl,
            ),
            children: <Widget>[
              Text(
                l10n.insightsScreenSubtitle(insights.length),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: BaseeraSpacing.lg),
              ...insights.map(
                (LocalInsight i) => Padding(
                  padding: const EdgeInsets.only(bottom: BaseeraSpacing.md),
                  child: _InsightTile(insight: i, l10n: l10n),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _InsightTile extends StatelessWidget {
  const _InsightTile({required this.insight, required this.l10n});

  final LocalInsight insight;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final Color accent = switch (insight.type) {
      LocalInsightType.overlap => const Color(0xFFC9A227),
      LocalInsightType.trial => const Color(0xFF2E7D32),
    };
    final String title = switch (insight.type) {
      LocalInsightType.overlap => l10n.insightOverlap(
          insight.categoryKey.labelIn(l10n),
        ),
      LocalInsightType.trial => l10n.insightTrial,
    };
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .surfaceContainerHighest
            .withOpacity(0.35),
        borderRadius: BorderRadius.circular(BaseeraRadii.md),
        border: BorderDirectional(
          start: BorderSide(color: accent, width: 4),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(
          BaseeraSpacing.md,
          BaseeraSpacing.md,
          BaseeraSpacing.md,
          BaseeraSpacing.md,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }
}
