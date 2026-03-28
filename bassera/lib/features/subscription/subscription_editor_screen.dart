import 'package:baseera/design_system/baseera_tokens.dart';
import 'package:baseera/l10n/app_localizations.dart';
import 'package:baseera/l10n/billing_cycle_l10n.dart';
import 'package:baseera/l10n/category_labels.dart';
import 'package:baseera/models/billing_cycle.dart';
import 'package:baseera/models/subscription.dart';
import 'package:baseera/models/app_settings.dart';
import 'package:baseera/providers/app_settings_provider.dart';
import 'package:baseera/providers/subscriptions_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class SubscriptionEditorScreen extends ConsumerStatefulWidget {
  const SubscriptionEditorScreen({super.key, this.existing});

  final Subscription? existing;

  @override
  ConsumerState<SubscriptionEditorScreen> createState() =>
      _SubscriptionEditorScreenState();
}

class _SubscriptionEditorScreenState
    extends ConsumerState<SubscriptionEditorScreen> {
  static const List<String> _categoryKeys = <String>[
    'streaming',
    'music',
    'productivity',
    'cloud',
    'other',
  ];

  static const Color _fieldFill = Color(0xFFF3EFE8);
  static const Color _chipSelectedFill = Color(0xFFE8E3FF);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _amountController;
  late BillingCycle _cycle;
  late DateTime _renewal;
  late String _categoryKey;
  late bool _isTrial;
  DateTime? _trialEnd;
  late final TextEditingController _sharingController;
  bool _saving = false;

  static final DateFormat _date = DateFormat.yMMMd();

  bool get _isEditing => widget.existing != null;

  @override
  void initState() {
    super.initState();
    final Subscription? e = widget.existing;
    _nameController = TextEditingController(text: e?.name ?? '');
    _amountController = TextEditingController(
      text: e == null ? '' : _formatAmount(e.amount),
    );
    _cycle = e?.billingCycle ?? BillingCycle.monthly;
    _renewal = e?.nextRenewal ?? DateTime.now();
    final String? cat = e?.category?.trim().toLowerCase();
    _categoryKey =
        cat != null && _categoryKeys.contains(cat) ? cat : 'other';
    _isTrial = e?.isFreeTrial ?? false;
    _trialEnd = e?.trialEndsAt;
    _sharingController =
        TextEditingController(text: e?.sharingNote ?? '');
  }

  String _formatAmount(double value) {
    if (value == value.roundToDouble()) {
      return value.toStringAsFixed(0);
    }
    return value.toStringAsFixed(2);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _sharingController.dispose();
    super.dispose();
  }

  InputDecoration _fieldDecoration(
    BuildContext context, {
    required String label,
    String? hint,
    Widget? suffix,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      filled: true,
      fillColor: _fieldFill,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(BaseeraRadii.md),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(BaseeraRadii.md),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.5),
        ),
      ),
      suffix: suffix,
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final TextTheme text = Theme.of(context).textTheme;
    final ColorScheme cs = Theme.of(context).colorScheme;
    final AsyncValue<AppSettings> settings = ref.watch(appSettingsProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF7),
      appBar: AppBar(
        title: Text(_isEditing ? l10n.editSubscription : l10n.addSubscription),
        actions: <Widget>[
          if (_isEditing)
            IconButton(
              tooltip: l10n.deleteTooltip,
              onPressed: _saving ? null : _confirmDelete,
              icon: const Icon(Icons.delete_outline_rounded),
            ),
        ],
      ),
      body: settings.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(child: Text(l10n.loadError)),
        data: (AppSettings appSettings) {
          return Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsetsDirectional.all(BaseeraSpacing.md),
              children: <Widget>[
                if (!_isEditing) ...<Widget>[
                  Text(
                    l10n.addSubscription,
                    style: text.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: BaseeraSpacing.xs),
                  Text(
                    l10n.addSubscriptionSubtitle,
                    style: text.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: BaseeraSpacing.lg),
                ],
                TextFormField(
                  controller: _nameController,
                  textCapitalization: TextCapitalization.words,
                  decoration: _fieldDecoration(
                    context,
                    label: l10n.serviceName,
                    hint: l10n.serviceNameHint,
                  ),
                  validator: (String? v) {
                    if (v == null || v.trim().isEmpty) {
                      return l10n.validatorName;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: BaseeraSpacing.md),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: _amountController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        decoration: _fieldDecoration(
                          context,
                          label: l10n.amountLabel,
                        ),
                        validator: (String? v) {
                          if (v == null || v.trim().isEmpty) {
                            return l10n.validatorAmount;
                          }
                          final double? parsed = double.tryParse(v.trim());
                          if (parsed == null || parsed <= 0) {
                            return l10n.validatorAmountPositive;
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: BaseeraSpacing.sm),
                    SizedBox(
                      width: 108,
                      child: DropdownButtonFormField<String>(
                        value: appSettings.currencyCode,
                        decoration: _fieldDecoration(
                          context,
                          label: l10n.currency,
                        ),
                        items: AppSettingsNotifier.supportedCurrencies
                            .map(
                              (String code) => DropdownMenuItem<String>(
                                value: code,
                                child: Text(code),
                              ),
                            )
                            .toList(),
                        onChanged: _saving
                            ? null
                            : (String? v) {
                                if (v != null) {
                                  ref
                                      .read(appSettingsProvider.notifier)
                                      .setCurrencyCode(v);
                                }
                              },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: BaseeraSpacing.md),
                DropdownButtonFormField<BillingCycle>(
                  value: _cycle,
                  decoration: _fieldDecoration(
                    context,
                    label: l10n.billingCycle,
                  ),
                  items: BillingCycle.values
                      .map(
                        (BillingCycle c) => DropdownMenuItem<BillingCycle>(
                          value: c,
                          child: Text(c.localizedLabel(l10n)),
                        ),
                      )
                      .toList(),
                  onChanged: (BillingCycle? value) {
                    if (value != null) {
                      setState(() => _cycle = value);
                    }
                  },
                ),
                const SizedBox(height: BaseeraSpacing.md),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(l10n.nextRenewal, style: text.titleSmall),
                  subtitle: Text(_date.format(_renewal)),
                  trailing: Icon(Icons.calendar_month_rounded, color: cs.primary),
                  onTap: _saving ? null : _pickRenewal,
                ),
                const SizedBox(height: BaseeraSpacing.md),
                Text(l10n.categoryOptional, style: text.titleSmall),
                const SizedBox(height: BaseeraSpacing.sm),
                Wrap(
                  spacing: BaseeraSpacing.sm,
                  runSpacing: BaseeraSpacing.sm,
                  children: _categoryKeys.map((String key) {
                    final bool selected = _categoryKey == key;
                    return FilterChip(
                      label: Text(key.labelIn(l10n)),
                      selected: selected,
                      onSelected: _saving
                          ? null
                          : (bool v) {
                              if (v) {
                                setState(() => _categoryKey = key);
                              }
                            },
                      selectedColor: _chipSelectedFill,
                      checkmarkColor: cs.primary,
                      backgroundColor: _fieldFill,
                      side: BorderSide(
                        color: selected ? cs.primary : cs.outlineVariant,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: BaseeraSpacing.lg),
                Text(l10n.isFreeTrial, style: text.titleSmall),
                const SizedBox(height: BaseeraSpacing.sm),
                SegmentedButton<bool>(
                  segments: <ButtonSegment<bool>>[
                    ButtonSegment<bool>(value: true, label: Text(l10n.yes)),
                    ButtonSegment<bool>(value: false, label: Text(l10n.no)),
                  ],
                  selected: <bool>{_isTrial},
                  onSelectionChanged: _saving
                      ? null
                      : (Set<bool> next) {
                          setState(() {
                            _isTrial = next.first;
                            if (!_isTrial) {
                              _trialEnd = null;
                            }
                          });
                        },
                ),
                if (_isTrial) ...<Widget>[
                  const SizedBox(height: BaseeraSpacing.md),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(l10n.trialEnds, style: text.titleSmall),
                    subtitle: Text(
                      _trialEnd != null
                          ? _date.format(_trialEnd!)
                          : l10n.validatorTrialEnd,
                    ),
                    trailing: Icon(Icons.event_rounded, color: cs.primary),
                    onTap: _saving ? null : _pickTrialEnd,
                  ),
                ],
                const SizedBox(height: BaseeraSpacing.lg),
                TextFormField(
                  controller: _sharingController,
                  maxLines: 2,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: _fieldDecoration(
                    context,
                    label: l10n.sharingNoteLabel,
                    hint: l10n.sharingNoteHint,
                  ),
                ),
                const SizedBox(height: BaseeraSpacing.xl),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: _saving ? null : _save,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: BaseeraSpacing.md,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(BaseeraRadii.lg),
                      ),
                      side: BorderSide(color: cs.onSurface, width: 1.2),
                    ),
                    child: Text(
                      _isEditing ? l10n.saveChanges : l10n.saveSubscription,
                      style: text.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _pickRenewal() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _renewal,
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 5)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
    );
    if (picked != null) {
      setState(() => _renewal = picked);
    }
  }

  Future<void> _pickTrialEnd() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _trialEnd ?? DateTime.now().add(const Duration(days: 7)),
      firstDate: DateTime.now().subtract(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
    );
    if (picked != null) {
      setState(() => _trialEnd = picked);
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (_isTrial && _trialEnd == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.validatorTrialEnd)),
      );
      return;
    }
    setState(() => _saving = true);
    try {
      final double amount = double.parse(_amountController.text.trim());
      final String id = widget.existing?.id ?? const Uuid().v4();

      final String sharingTrimmed = _sharingController.text.trim();
      final Subscription sub = Subscription(
        id: id,
        name: _nameController.text.trim(),
        amount: amount,
        billingCycle: _cycle,
        nextRenewal: _renewal,
        category: _categoryKey == 'other' ? null : _categoryKey,
        isFreeTrial: _isTrial,
        trialEndsAt: _trialEnd,
        sharingNote:
            sharingTrimmed.isEmpty ? null : sharingTrimmed,
      );

      await ref.read(subscriptionsProvider.notifier).upsert(sub);
      if (mounted) {
        Navigator.of(context).pop();
      }
    } finally {
      if (mounted) {
        setState(() => _saving = false);
      }
    }
  }

  Future<void> _confirmDelete() async {
    final Subscription? e = widget.existing;
    if (e == null) {
      return;
    }
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final bool? ok = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(l10n.confirmDeleteTitle),
        content: Text(l10n.confirmDeleteBody(e.name)),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.deleteAction),
          ),
        ],
      ),
    );
    if (ok == true && mounted) {
      setState(() => _saving = true);
      try {
        await ref.read(subscriptionsProvider.notifier).remove(e.id);
        if (mounted) {
          Navigator.of(context).pop();
        }
      } finally {
        if (mounted) {
          setState(() => _saving = false);
        }
      }
    }
  }
}
