import 'package:baseera/core/money_format.dart';
import 'package:baseera/design_system/baseera_tokens.dart';
import 'package:baseera/l10n/app_localizations.dart';
import 'package:baseera/models/app_settings.dart';
import 'package:baseera/models/family_member.dart';
import 'package:baseera/models/subscription.dart';
import 'package:baseera/providers/app_settings_provider.dart';
import 'package:baseera/providers/family_workspace_provider.dart';
import 'package:baseera/providers/subscriptions_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FamilyWorkspaceScreen extends ConsumerStatefulWidget {
  const FamilyWorkspaceScreen({super.key});

  @override
  ConsumerState<FamilyWorkspaceScreen> createState() =>
      _FamilyWorkspaceScreenState();
}

class _FamilyWorkspaceScreenState extends ConsumerState<FamilyWorkspaceScreen> {
  final List<TextEditingController> _nameCtrls = <TextEditingController>[];
  final List<TextEditingController> _shareCtrls = <TextEditingController>[];
  String _controllersKey = '';

  @override
  void dispose() {
    for (final TextEditingController c in _nameCtrls) {
      c.dispose();
    }
    for (final TextEditingController c in _shareCtrls) {
      c.dispose();
    }
    super.dispose();
  }

  void _ensureControllers(List<FamilyMember> members) {
    final String key = members
        .map(
          (FamilyMember m) =>
              '${m.id}|${m.name}|${m.monthlyShare.toString()}',
        )
        .join(';;');
    if (key == _controllersKey && _nameCtrls.length == members.length) {
      return;
    }
    for (final TextEditingController c in _nameCtrls) {
      c.dispose();
    }
    for (final TextEditingController c in _shareCtrls) {
      c.dispose();
    }
    _nameCtrls.clear();
    _shareCtrls.clear();
    for (final FamilyMember m in members) {
      _nameCtrls.add(TextEditingController(text: m.name));
      _shareCtrls.add(
        TextEditingController(text: _formatShare(m.monthlyShare)),
      );
    }
    _controllersKey = key;
  }

  static String _formatShare(double v) {
    if (v == v.roundToDouble()) {
      return v.toStringAsFixed(0);
    }
    return v.toStringAsFixed(2);
  }

  static String _titleFor(
    AppLocalizations l10n,
    FamilyMember m,
    int index,
  ) {
    final String trimmed = m.name.trim();
    if (trimmed.isNotEmpty) {
      return trimmed;
    }
    if (index == 0) {
      return l10n.familyYou;
    }
    return l10n.familyMemberNumber(index + 1);
  }

  Future<void> _saveMembers(List<FamilyMember> current) async {
    final List<FamilyMember> next = <FamilyMember>[];
    for (int i = 0; i < current.length; i++) {
      final double share =
          double.tryParse(_shareCtrls[i].text.trim().replaceAll(',', '.')) ??
              0;
      next.add(
        current[i].copyWith(
          name: _nameCtrls[i].text.trim(),
          monthlyShare: share < 0 ? 0 : share,
        ),
      );
    }
    await ref.read(familyWorkspaceProvider.notifier).replaceAll(next);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.familySplitSaved)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final AsyncValue<List<FamilyMember>> family =
        ref.watch(familyWorkspaceProvider);
    final AsyncValue<AppSettings> settings = ref.watch(appSettingsProvider);
    final AsyncValue<List<Subscription>> subs =
        ref.watch(subscriptionsProvider);
    final String localeName = Localizations.localeOf(context).toString();

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.familyWorkspaceTitle),
      ),
      body: family.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(child: Text(l10n.loadError)),
        data: (List<FamilyMember> members) {
          _ensureControllers(members);
          return settings.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => Center(child: Text(l10n.loadError)),
            data: (AppSettings appSettings) {
              final NumberFormat money = moneyFormatter(
                currencyCode: appSettings.currencyCode,
                localeName: localeName,
              );
              final double totalShare = members.fold<double>(
                0,
                (double s, FamilyMember m) => s + m.monthlyShare,
              );
              return subs.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (_, __) => Center(child: Text(l10n.loadError)),
                data: (List<Subscription> list) {
                  final List<Subscription> shared = list
                      .where(
                        (Subscription s) =>
                            (s.sharingNote ?? '').trim().isNotEmpty,
                      )
                      .toList();
                  return ListView(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                      BaseeraSpacing.md,
                      BaseeraSpacing.sm,
                      BaseeraSpacing.md,
                      BaseeraSpacing.xxl,
                    ),
                    children: <Widget>[
                      Text(
                        l10n.familyWorkspaceSubtitle(
                          members.length,
                          money.format(totalShare),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                      ),
                      const SizedBox(height: BaseeraSpacing.lg),
                      ...List<Widget>.generate(members.length, (int i) {
                        final FamilyMember m = members[i];
                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: BaseeraSpacing.md,
                          ),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.all(
                                BaseeraSpacing.md,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    _titleFor(l10n, m, i),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w800,
                                        ),
                                  ),
                                  const SizedBox(height: BaseeraSpacing.sm),
                                  TextField(
                                    controller: _nameCtrls[i],
                                    decoration: InputDecoration(
                                      labelText: l10n.familyMemberNameLabel,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          BaseeraRadii.md,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: BaseeraSpacing.sm),
                                  TextField(
                                    controller: _shareCtrls[i],
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                    decoration: InputDecoration(
                                      labelText: l10n.familyMemberShareLabel(
                                        appSettings.currencyCode,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          BaseeraRadii.md,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      FilledButton(
                        onPressed: () => _saveMembers(members),
                        child: Text(l10n.familySaveSplit),
                      ),
                      const SizedBox(height: BaseeraSpacing.xl),
                      Text(
                        l10n.familySharedPlans,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      const SizedBox(height: BaseeraSpacing.sm),
                      if (shared.isEmpty)
                        Text(
                          l10n.familyNoSharedPlans,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                              ),
                        )
                      else
                        ...shared.map(
                          (Subscription s) => ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(s.name),
                            subtitle: Text(s.sharingNote!.trim()),
                            leading: Icon(
                              Icons.people_outline_rounded,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                    ],
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
