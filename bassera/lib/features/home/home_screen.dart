import 'package:baseera/core/money_format.dart';
import 'package:baseera/design_system/baseera_tokens.dart';
import 'package:baseera/design_system/widgets/baseera_card.dart';
import 'package:baseera/domain/insight_engine.dart';
import 'package:baseera/features/subscription/subscription_editor_screen.dart';
import 'package:baseera/l10n/app_localizations.dart';
import 'package:baseera/l10n/billing_cycle_l10n.dart';
import 'package:baseera/l10n/category_labels.dart';
import 'package:baseera/models/app_settings.dart';
import 'package:baseera/models/subscription.dart';
import 'package:baseera/providers/app_settings_provider.dart';
import 'package:baseera/providers/subscriptions_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key, required this.onAdd});

  final VoidCallback onAdd;

  static String _dashboardGreeting(AppLocalizations l10n, String name) {
    final int h = DateTime.now().hour;
    final String base = h < 12
        ? l10n.greetMorning
        : (h < 17 ? l10n.greetAfternoon : l10n.greetEvening);
    if (name.trim().isEmpty) {
      return base;
    }
    return '$base${l10n.greetNameClause(name.trim())}';
  }

  static double _dueThisWeekSpend(List<Subscription> list) {
    return list
        .where((Subscription s) => s.renewsWithinWeek)
        .fold<double>(0, (double a, Subscription s) => a + s.amount);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final AsyncValue<List<Subscription>> subs = ref.watch(subscriptionsProvider);
    final AsyncValue<AppSettings> settings = ref.watch(appSettingsProvider);
    final TextTheme text = Theme.of(context).textTheme;
    final String localeName = Localizations.localeOf(context).toString();

    final String monthLine =
        DateFormat.yMMMM(localeName).format(DateTime.now());

    return settings.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => Center(child: Text(l10n.loadError)),
      data: (AppSettings appSettings) {
        final NumberFormat money = moneyFormatter(
          currencyCode: appSettings.currencyCode,
          localeName: localeName,
        );
        return subs.when(
          loading: () => CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: _DashboardHeader(
                  l10n: l10n,
                  greeting: _dashboardGreeting(l10n, appSettings.displayName),
                  activeCount: 0,
                  monthLabel: monthLine,
                ),
              ),
              const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
          error: (Object err, StackTrace st) => CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: _DashboardHeader(
                  l10n: l10n,
                  greeting: _dashboardGreeting(l10n, appSettings.displayName),
                  activeCount: 0,
                  monthLabel: monthLine,
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsetsDirectional.all(BaseeraSpacing.lg),
                  child: Center(
                    child: Text(
                      l10n.loadError,
                      style: text.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
          data: (List<Subscription> list) {
            if (list.isEmpty) {
              return CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: _DashboardHeader(
                      l10n: l10n,
                      greeting: _dashboardGreeting(l10n, appSettings.displayName),
                      activeCount: 0,
                      monthLabel: monthLine,
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: _EmptyState(l10n: l10n, onAdd: onAdd),
                  ),
                ],
              );
            }

            final List<Subscription> sorted = <Subscription>[...list]
              ..sort(
                (Subscription a, Subscription b) =>
                    a.nextRenewal.compareTo(b.nextRenewal),
              );
            final double monthly = sorted.totalMonthlyEquivalent;
            final double dueWeek = _dueThisWeekSpend(sorted);
            final double annual = monthly * 12;
            final int insightCount = generateLocalInsights(sorted).length;
            return CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: _DashboardHeader(
                    l10n: l10n,
                    greeting: _dashboardGreeting(l10n, appSettings.displayName),
                    activeCount: list.length,
                    monthLabel: monthLine,
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                    BaseeraSpacing.md,
                    BaseeraSpacing.sm,
                    BaseeraSpacing.md,
                    BaseeraSpacing.md,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: _StatsGrid(
                      l10n: l10n,
                      money: money,
                      monthly: monthly,
                      dueThisWeek: dueWeek,
                      annual: annual,
                      insightsWaiting: insightCount,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                    BaseeraSpacing.md,
                    0,
                    BaseeraSpacing.md,
                    BaseeraSpacing.sm,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 4,
                          height: 22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                Theme.of(context).colorScheme.primary,
                                Theme.of(context).colorScheme.secondary,
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: BaseeraSpacing.sm),
                        Text(
                          l10n.upcomingRenewals.toUpperCase(),
                          style: text.labelLarge?.copyWith(
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.6,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                    BaseeraSpacing.md,
                    0,
                    BaseeraSpacing.md,
                    BaseeraSpacing.xxl,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int i) {
                        final Subscription s = sorted[i];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: BaseeraSpacing.sm),
                          child: BaseeraCard(
                            onTap: () => _openEditor(context, s),
                            child: _SubscriptionRow(
                              subscription: s,
                              money: money,
                              l10n: l10n,
                              localeName: localeName,
                            ),
                          ),
                        );
                      },
                      childCount: sorted.length,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _openEditor(BuildContext context, Subscription s) async {
    await Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (BuildContext context) =>
            SubscriptionEditorScreen(existing: s),
      ),
    );
  }
}

class _DashboardHeader extends StatelessWidget {
  const _DashboardHeader({
    required this.l10n,
    required this.greeting,
    required this.activeCount,
    this.monthLabel,
  });

  final AppLocalizations l10n;
  final String greeting;
  final int activeCount;
  final String? monthLabel;

  @override
  Widget build(BuildContext context) {
    final ColorScheme cs = Theme.of(context).colorScheme;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(
          BaseeraSpacing.md,
          BaseeraSpacing.md,
          BaseeraSpacing.md,
          BaseeraSpacing.sm,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: cs.primaryContainer.withOpacity(0.55),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: BaseeraSpacing.sm + 2,
                    vertical: BaseeraSpacing.xs,
                  ),
                  child: Text(
                    l10n.rtlBanner,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: cs.onPrimaryContainer,
                        ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: BaseeraSpacing.md),
            Text(
              greeting,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            if (monthLabel != null) ...<Widget>[
              const SizedBox(height: BaseeraSpacing.xs),
              Text(
                monthLabel!,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
            const SizedBox(height: BaseeraSpacing.xs),
            Text(
              l10n.activeCount(activeCount),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatsGrid extends StatelessWidget {
  const _StatsGrid({
    required this.l10n,
    required this.money,
    required this.monthly,
    required this.dueThisWeek,
    required this.annual,
    required this.insightsWaiting,
  });

  final AppLocalizations l10n;
  final NumberFormat money;
  final double monthly;
  final double dueThisWeek;
  final double annual;
  final int insightsWaiting;

  static const Color _dueWeekColor = Color(0xFFB45309);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: BaseeraSpacing.sm,
      crossAxisSpacing: BaseeraSpacing.sm,
      childAspectRatio: 1.35,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        _StatCard(
          label: l10n.statMonthlyTotal,
          value: money.format(monthly),
          valueColor: Theme.of(context).colorScheme.onSurface,
        ),
        _StatCard(
          label: l10n.statDueThisWeek,
          value: money.format(dueThisWeek),
          valueColor: _dueWeekColor,
          emphasized: true,
        ),
        _StatCard(
          label: l10n.statAnnualProjection,
          value: money.format(annual),
          valueColor: Theme.of(context).colorScheme.onSurface,
        ),
        _StatCard(
          label: l10n.statInsightsWaiting,
          value: '$insightsWaiting',
          valueColor: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.valueColor,
    this.emphasized = false,
  });

  final String label;
  final String value;
  final Color valueColor;
  final bool emphasized;

  @override
  Widget build(BuildContext context) {
    final ColorScheme cs = Theme.of(context).colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(BaseeraRadii.lg),
        border: Border.all(
          color: emphasized
              ? _StatsGrid._dueWeekColor.withOpacity(0.35)
              : cs.outlineVariant.withOpacity(0.6),
        ),
        boxShadow: emphasized
            ? <BoxShadow>[
                BoxShadow(
                  color: _StatsGrid._dueWeekColor.withOpacity(0.12),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.all(BaseeraSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: valueColor,
                  ),
            ),
            const SizedBox(height: BaseeraSpacing.xs),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: cs.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SubscriptionRow extends StatelessWidget {
  const _SubscriptionRow({
    required this.subscription,
    required this.money,
    required this.l10n,
    required this.localeName,
  });

  final Subscription subscription;
  final NumberFormat money;
  final AppLocalizations l10n;
  final String localeName;

  @override
  Widget build(BuildContext context) {
    final TextTheme text = Theme.of(context).textTheme;
    final ColorScheme cs = Theme.of(context).colorScheme;
    final int diff = _renewalDiffDays(subscription.nextRenewal);
    final _UrgencyStyle urg = _urgencyForDiff(diff);
    final String cycleLabel = subscription.billingCycle.localizedLabel(l10n);
    final String renews = l10n.renewsLine(
      DateFormat.yMMMd(localeName).format(subscription.nextRenewal),
      cycleLabel,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                cs.primaryContainer,
                Color.lerp(cs.primaryContainer, cs.secondaryContainer, 0.35)!,
              ],
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            _initials(subscription.name),
            style: text.titleMedium?.copyWith(
              color: cs.onPrimaryContainer,
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
                subscription.name,
                style: text.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: BaseeraSpacing.xxs),
              Text(
                '${money.format(subscription.amount)} · $renews',
                style: text.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
              ),
              if (subscription.category != null &&
                  subscription.category!.trim().isNotEmpty) ...<Widget>[
                const SizedBox(height: BaseeraSpacing.xxs),
                Text(
                  subscription.category!.trim().labelIn(l10n),
                  style: text.labelMedium?.copyWith(
                    color: cs.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(width: BaseeraSpacing.sm),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: BaseeraSpacing.sm,
                vertical: BaseeraSpacing.xxs + 1,
              ),
              decoration: BoxDecoration(
                color: urg.background,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _renewalPhrase(diff, l10n),
                style: text.labelLarge?.copyWith(
                  color: urg.foreground,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: BaseeraSpacing.xs),
            Text(
              '${money.format(subscription.monthlyEquivalent)}${l10n.perMonthEquiv}',
              style: text.bodySmall?.copyWith(color: cs.onSurfaceVariant),
            ),
          ],
        ),
      ],
    );
  }

  static String _initials(String name) {
    if (name.trim().isEmpty) {
      return '?';
    }
    final List<String> parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name[0].toUpperCase();
  }

  static int _renewalDiffDays(DateTime date) {
    final DateTime today = DateTime.now();
    final DateTime t = DateTime(today.year, today.month, today.day);
    final DateTime d = DateTime(date.year, date.month, date.day);
    return d.difference(t).inDays;
  }

  static String _renewalPhrase(int diff, AppLocalizations l10n) {
    if (diff < 0) {
      return l10n.renewalDaysAgo(-diff);
    }
    if (diff == 0) {
      return l10n.renewalToday;
    }
    if (diff == 1) {
      return l10n.renewalTomorrow;
    }
    return l10n.renewalInDays(diff);
  }

  static _UrgencyStyle _urgencyForDiff(int diff) {
    if (diff == 1) {
      return const _UrgencyStyle(
        background: Color(0xFFFFE4E6),
        foreground: Color(0xFFB42318),
      );
    }
    if (diff >= 0 && diff <= 3) {
      return const _UrgencyStyle(
        background: Color(0xFFFFEDD5),
        foreground: Color(0xFFB45309),
      );
    }
    if (diff <= 7) {
      return const _UrgencyStyle(
        background: Color(0xFFE8F5E9),
        foreground: Color(0xFF2E7D32),
      );
    }
    return const _UrgencyStyle(
      background: Color(0xFFE8E3FF),
      foreground: Color(0xFF5B4FCF),
    );
  }
}

class _UrgencyStyle {
  const _UrgencyStyle({required this.background, required this.foreground});

  final Color background;
  final Color foreground;
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.l10n, required this.onAdd});

  final AppLocalizations l10n;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    final ColorScheme cs = Theme.of(context).colorScheme;
    final TextTheme text = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(BaseeraSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.subscriptions_rounded,
              size: 64,
              color: cs.primary,
            ),
            const SizedBox(height: BaseeraSpacing.lg),
            Text(
              l10n.emptyTitle,
              style: text.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: BaseeraSpacing.sm),
            Text(
              l10n.emptyBody,
              style: text.bodyMedium?.copyWith(
                color: cs.onSurfaceVariant,
                height: 1.45,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: BaseeraSpacing.lg),
            FilledButton.icon(
              onPressed: onAdd,
              icon: const Icon(Icons.add_rounded),
              label: Text(l10n.emptyCta),
            ),
          ],
        ),
      ),
    );
  }
}
