import 'package:baseera/design_system/baseera_tokens.dart';
import 'package:flutter/material.dart';

class BaseeraPrimaryButton extends StatelessWidget {
  const BaseeraPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final Widget child = icon == null
        ? Text(label)
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 20),
              const SizedBox(width: BaseeraSpacing.sm),
              Text(label),
            ],
          );

    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        padding: const EdgeInsets.symmetric(
          horizontal: BaseeraSpacing.lg,
          vertical: BaseeraSpacing.sm,
        ),
      ),
      child: child,
    );
  }
}
