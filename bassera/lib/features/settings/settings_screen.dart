import 'package:baseera/design_system/baseera_tokens.dart';
import 'package:baseera/features/family/family_workspace_screen.dart';
import 'package:baseera/l10n/app_localizations.dart';
import 'package:baseera/models/app_settings.dart';
import 'package:baseera/providers/app_settings_provider.dart';
import 'package:baseera/providers/session_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final TextEditingController _nameController = TextEditingController();
  bool _seededFromProvider = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final AsyncValue<AppSettings> settings = ref.watch(appSettingsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingsTitle),
      ),
      body: settings.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(child: Text(l10n.loadError)),
        data: (AppSettings s) {
          if (!_seededFromProvider) {
            _nameController.text = s.displayName;
            _seededFromProvider = true;
          }
          return ListView(
            padding: const EdgeInsetsDirectional.all(BaseeraSpacing.md),
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Icons.groups_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(l10n.familyWorkspaceTitle),
                subtitle: Text(l10n.familyWorkspaceSettingsSubtitle),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {
                  Navigator.of(context).push<void>(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const FamilyWorkspaceScreen(),
                    ),
                  );
                },
              ),
              const Divider(height: BaseeraSpacing.xl),
              Text(
                l10n.settingsDisplayName,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: BaseeraSpacing.sm),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: l10n.settingsDisplayNameHint,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(BaseeraRadii.md),
                  ),
                ),
              ),
              const SizedBox(height: BaseeraSpacing.lg),
              Text(
                l10n.settingsCurrency,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: BaseeraSpacing.sm),
              DropdownButtonFormField<String>(
                value: s.currencyCode,
                decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(BaseeraRadii.md),
                  ),
                ),
                items: AppSettingsNotifier.supportedCurrencies
                    .map(
                      (String code) => DropdownMenuItem<String>(
                        value: code,
                        child: Text(code),
                      ),
                    )
                    .toList(),
                onChanged: (String? v) {
                  if (v != null) {
                    ref.read(appSettingsProvider.notifier).setCurrencyCode(v);
                  }
                },
              ),
              const SizedBox(height: BaseeraSpacing.xl),
              FilledButton(
                onPressed: () async {
                  await ref
                      .read(appSettingsProvider.notifier)
                      .setDisplayName(_nameController.text.trim());
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l10n.settingsProfileUpdated)),
                    );
                  }
                },
                child: Text(l10n.settingsSaveProfile),
              ),
              const SizedBox(height: BaseeraSpacing.xxl),
              TextButton(
                onPressed: () async {
                  await ref.read(sessionProvider.notifier).signOut();
                },
                child: Text(l10n.settingsSignOut),
              ),
            ],
          );
        },
      ),
    );
  }
}
