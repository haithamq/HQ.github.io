import 'package:baseera/features/auth/landing_screen.dart';
import 'package:flutter/material.dart';

/// Nested navigator so [LandingScreen] can push [LoginScreen] without losing the app root.
class UnsignedFlow extends StatelessWidget {
  const UnsignedFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) => const LandingScreen(),
        );
      },
    );
  }
}
