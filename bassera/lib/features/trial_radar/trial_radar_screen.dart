import 'package:baseera/core/money_format.dart';
import 'package:baseera/design_system/baseera_tokens.dart';
import 'package:baseera/l10n/app_localizations.dart';
import 'package:baseera/l10n/billing_cycle_l10n.dart';
import 'package:baseera/models/app_settings.dart';
import 'package:baseera/models/subscription.dart';
import 'package:baseera/providers/app_settings_provider.dart';
import 'package:baseera/providers/subscriptions_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class TrialRadarScreen extends ConsumerWidget {
  const TrialRadarScreen({super.key, required this.onAdd});

  final VoidCallback onAdd;

  static int? _trialDaysRemaining(Subscription s) {
    if (!s.isFreeTrial || s.trialEndsAt == null) {
      return null;
    }
    final DateTime today = DateTime.now();
    final DateTime start =
        DateTime(today.year, today.month, today.day);
    final DateTime end = DateTime(
      s.trialEndsAt!.year,
      s.trialEndsAt!.month,
      s.trialEndsAt!.day,
    );
    return end.difference(start).inDays;
  }

  static _TrialStyle _styleForDays(int days) {
    if (days <= 2) {
      return const _TrialStyle(
        box: Color(0xFFFFE4E6),
        fg: Color(0xFFB42318),
        action: Color(0xFFB42318),
      );
    }
    if (days <= 5) {
      return const _TrialStyle(
        box: Color(0xFFFFF4D6),
        fg: Color(0xFFB45309),
        action: Color(0xFF92400E),
      );
    }
    return const _TrialStyle(
      box: Color(0xFFE8F5E9),
      fg: Color(0xFF2E7D32),
      action: Color(0xFF2E7D32),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final AsyncValue<List<Subscription>> subs = ref.watch(subscriptionsProvider);
    final AsyncValue<AppSettings> settings = ref.watch(appSettingsProvider);
    final String localeName = Localizations.localeOf(context).toString();

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.trialRadarTitle),
      ),
      body: settings.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(child: Text(l10n.loadError)),
        data: (AppSettings appSettings) {
          final NumberFormat money = moneyFormatter(
            currencyCode: appSettings.currencyCode,
            localeName: localeName,
          );
          final DateFormat dayFmt = DateFormat.MMMd(localeName);
          return subs.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => Center(child: Text(l10n.loadError)),
            data: (List<Subscription> list) {
              final DateTime today = DateTime.now();
              final DateTime todayStart =
                  DateTime(today.year, today.month, today.day);
              final List<Subscription> trials = list
                  .where(
                    (Subscription s) =>
                        s.isFreeTrial &&
                        s.trialEndsAt != null &&
                        !DateTime(
                          s.trialEndsAt!.year,
                          s.trialEndsAt!.month,
                          s.trialEndsAt!.day,
                        ).isBefore(todayStart),
                  )
                  .toList()
                ..sort(
                  (Subscription a, Subscription b) =>
                      a.trialEndsAt!.compareTo(b.trialEndsAt!),
                );

              if (trials.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(BaseeraSpacing.xl),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.timer_outlined, size: 56, color: Theme.of(context).colorScheme.primary),
                        const SizedBox(height: BaseeraSpacing.lg),
                        Text(
                          l10n.trialRadarEmpty,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: BaseeraSpacing.md),
                        FilledButton(
                          onPressed: onAdd,
                          child: Text(l10n.addFab),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return ListView(
                padding: const EdgeInsetsDirectional.fromSTEB(
                  BaseeraSpacing.md,
                  BaseeraSpacing.sm,
                  BaseeraSpacing.md,
                  BaseeraSpacing.xxl,
                ),
                children: <Widget>[
                  Text(
                    l10n.trialRadarSubtitle(trials.length),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                  const SizedBox(height: BaseeraSpacing.lg),
                  ...trials.map(
                    (Subscription s) {
                      final int days = _trialDaysRemaining(s) ?? 0;
                      final _TrialStyle st = _styleForDays(days);
                      final String chargeDate =
                          dayFmt.format(s.nextRenewal);
                      return Padding(
                        padding: const EdgeInsets.only(bottom: BaseeraSpacing.md),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 56,
                              padding: const EdgeInsets.symmetric(
                                vertical: BaseeraSpacing.sm,
                              ),
                              decoration: BoxDecoration(
                                color: st.box,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                l10n.trialDaysLeft(days),
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      color: st.fg,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                            const SizedBox(width: BaseeraSpacing.md),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    s.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(fontWeight: FontWeight.w800),
                                  ),
                                  const SizedBox(height: BaseeraSpacing.xxs),
                                  Text(
                                    l10n.trialChargeLine(
                                      money.format(s.amount),
                                      chargeDate,
                                      s.billingCycle.localizedLabel(l10n),
                                    ),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurfaceVariant,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(l10n.cancelGuideSoon)),
                                );
                              },
                              child: Text(
                                l10n.cancelGuide,
                                style: TextStyle(color: st.action),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class _TrialStyle {
  const _TrialStyle({
    required this.box,
    required this.fg,
    required this.action,
  });

  final Color box;
  final Color fg;
  final Color action;
}
