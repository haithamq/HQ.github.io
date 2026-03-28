import 'package:baseera/features/all_subs/all_subscriptions_screen.dart';
import 'package:baseera/features/home/home_screen.dart';
import 'package:baseera/features/insights/insights_screen.dart';
import 'package:baseera/features/settings/settings_screen.dart';
import 'package:baseera/features/trial_radar/trial_radar_screen.dart';
import 'package:baseera/features/subscription/subscription_editor_screen.dart';
import 'package:baseera/l10n/app_localizations.dart';
import 'package:baseera/models/subscription.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainShellScreen extends ConsumerStatefulWidget {
  const MainShellScreen({super.key});

  @override
  ConsumerState<MainShellScreen> createState() => _MainShellScreenState();
}

class _MainShellScreenState extends ConsumerState<MainShellScreen> {
  int _index = 0;

  Future<void> _openEditor(Subscription? existing) async {
    await Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (BuildContext context) =>
            SubscriptionEditorScreen(existing: existing),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _index,
        children: <Widget>[
          HomeScreen(onAdd: () => _openEditor(null)),
          AllSubscriptionsScreen(
            onAdd: () => _openEditor(null),
            onOpen: (Subscription s) => _openEditor(s),
          ),
          TrialRadarScreen(onAdd: () => _openEditor(null)),
          const InsightsScreen(),
          const SettingsScreen(),
        ],
      ),
      floatingActionButton: _index == 0 || _index == 1 || _index == 2
          ? FloatingActionButton.extended(
              onPressed: () => _openEditor(null),
              icon: const Icon(Icons.add_rounded),
              label: Text(l10n.addFab),
            )
          : null,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (int i) => setState(() => _index = i),
        destinations: <NavigationDestination>[
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home_rounded),
            label: l10n.tabHome,
          ),
          NavigationDestination(
            icon: const Icon(Icons.list_alt_outlined),
            selectedIcon: const Icon(Icons.list_alt_rounded),
            label: l10n.tabAllSubs,
          ),
          NavigationDestination(
            icon: const Icon(Icons.timer_outlined),
            selectedIcon: const Icon(Icons.timer_rounded),
            label: l10n.tabTrialRadar,
          ),
          NavigationDestination(
            icon: const Icon(Icons.auto_awesome_outlined),
            selectedIcon: const Icon(Icons.auto_awesome_rounded),
            label: l10n.tabInsights,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings_rounded),
            label: l10n.tabSettings,
          ),
        ],
      ),
    );
  }
}
