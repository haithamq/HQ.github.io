import 'package:baseera/design_system/baseera_tokens.dart';
import 'package:baseera/features/auth/baseera_logo_mark.dart';
import 'package:baseera/l10n/app_localizations.dart';
import 'package:baseera/providers/session_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'login_screen.dart';

class LandingScreen extends ConsumerWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final ColorScheme cs = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: BaseeraSpacing.lg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Spacer(flex: 1),
              const Center(child: BaseeraLogoMark()),
              const SizedBox(height: BaseeraSpacing.xl),
              Text(
                l10n.appTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
              const SizedBox(height: BaseeraSpacing.sm),
              Text(
                l10n.tagline,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: BaseeraSpacing.lg),
              Text(
                l10n.heroDescription,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      height: 1.45,
                      color: cs.onSurfaceVariant,
                    ),
              ),
              const Spacer(flex: 2),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push<void>(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const LoginScreen(),
                    ),
                  );
                },
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: BaseeraSpacing.md,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(BaseeraRadii.lg),
                  ),
                ),
                child: Text(l10n.landingSignIn),
              ),
              const SizedBox(height: BaseeraSpacing.sm),
              OutlinedButton(
                onPressed: () async {
                  await ref.read(sessionProvider.notifier).setSignedIn(true);
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: BaseeraSpacing.md,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(BaseeraRadii.lg),
                  ),
                ),
                child: Text(l10n.landingContinueGuest),
              ),
              const SizedBox(height: BaseeraSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}
