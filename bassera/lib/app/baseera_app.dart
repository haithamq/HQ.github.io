import 'package:baseera/design_system/baseera_theme.dart';
import 'package:baseera/features/auth/splash_screen.dart';
import 'package:baseera/features/auth/unsigned_flow.dart';
import 'package:baseera/features/shell/main_shell_screen.dart';
import 'package:baseera/l10n/app_localizations.dart';
import 'package:baseera/providers/session_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseeraApp extends ConsumerWidget {
  const BaseeraApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<bool> session = ref.watch(sessionProvider);

    return MaterialApp(
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: BaseeraTheme.light(),
      darkTheme: BaseeraTheme.dark(),
      themeMode: ThemeMode.system,
      home: session.when(
        loading: () => const SplashScreen(showLoader: true),
        error: (_, __) => const UnsignedFlow(),
        data: (bool signedIn) =>
            signedIn ? const MainShellScreen() : const UnsignedFlow(),
      ),
    );
  }
}
