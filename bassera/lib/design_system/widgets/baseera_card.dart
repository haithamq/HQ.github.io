import 'package:baseera/design_system/baseera_tokens.dart';
import 'package:flutter/material.dart';

class BaseeraCard extends StatelessWidget {
  const BaseeraCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(BaseeraSpacing.md),
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final ColorScheme cs = Theme.of(context).colorScheme;
    final bool dark = cs.brightness == Brightness.dark;
    final Widget content = Padding(padding: padding, child: child);

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BaseeraRadii.card,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(dark ? 0.38 : 0.06),
            blurRadius: dark ? 24 : 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: cs.surface,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BaseeraRadii.card,
          side: BorderSide(color: cs.outline.withOpacity(dark ? 0.65 : 0.5)),
        ),
        clipBehavior: Clip.antiAlias,
        child: onTap == null
            ? content
            : InkWell(
                onTap: onTap,
                child: content,
              ),
      ),
    );
  }
}
