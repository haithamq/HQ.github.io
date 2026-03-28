import 'package:baseera/design_system/baseera_tokens.dart';
import 'package:baseera/design_system/widgets/baseera_card.dart';
import 'package:baseera/l10n/app_localizations.dart';
import 'package:baseera/l10n/billing_cycle_l10n.dart';
import 'package:baseera/l10n/category_labels.dart';
import 'package:baseera/core/money_format.dart';
import 'package:baseera/models/app_settings.dart';
import 'package:baseera/models/subscription.dart';
import 'package:baseera/providers/app_settings_provider.dart';
import 'package:baseera/providers/subscriptions_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class AllSubscriptionsScreen extends ConsumerWidget {
  const AllSubscriptionsScreen({
    super.key,
    required this.onAdd,
    required this.onOpen,
  });

  final VoidCallback onAdd;
  final void Function(Subscription subscription) onOpen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final AsyncValue<List<Subscription>> subs = ref.watch(subscriptionsProvider);
    final AsyncValue<AppSettings> settings = ref.watch(appSettingsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.allSubscriptionsTitle),
      ),
      body: settings.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(child: Text(l10n.loadError)),
        data: (AppSettings s) {
          final NumberFormat money = moneyFormatter(
            currencyCode: s.currencyCode,
            localeName: Localizations.localeOf(context).toString(),
          );
          return subs.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => Center(child: Text(l10n.loadError)),
            data: (List<Subscription> list) {
              if (list.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(BaseeraSpacing.lg),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(l10n.emptyTitle, textAlign: TextAlign.center),
                        const SizedBox(height: BaseeraSpacing.md),
                        FilledButton(
                          onPressed: onAdd,
                          child: Text(l10n.emptyCta),
                        ),
                      ],
                    ),
                  ),
                );
              }
              final List<Subscription> sorted = <Subscription>[...list]
                ..sort(
                  (Subscription a, Subscription b) =>
                      a.name.toLowerCase().compareTo(b.name.toLowerCase()),
                );
              return ListView.separated(
                padding: const EdgeInsetsDirectional.fromSTEB(
                  BaseeraSpacing.md,
                  BaseeraSpacing.sm,
                  BaseeraSpacing.md,
                  BaseeraSpacing.xxl,
                ),
                itemCount: sorted.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: BaseeraSpacing.sm),
                itemBuilder: (BuildContext context, int i) {
                  final Subscription sub = sorted[i];
                  return BaseeraCard(
                    onTap: () => onOpen(sub),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        sub.name,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(
                        '${money.format(sub.amount)} · ${sub.billingCycle.localizedLabel(l10n)} · ${sub.category.labelIn(l10n)}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      trailing: Icon(
                        Icons.chevron_right_rounded,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
