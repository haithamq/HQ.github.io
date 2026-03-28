import 'package:baseera/design_system/baseera_tokens.dart';
import 'package:flutter/material.dart';

/// Vector-style logo mark (no raster asset). Replace with [Image.asset] when ready.
class BaseeraLogoMark extends StatelessWidget {
  const BaseeraLogoMark({
    super.key,
    this.size = 88,
    this.iconSize = 44,
  });

  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * 0.26),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            BaseeraBrand.primary,
            Color(0xFF6B3FA0),
            BaseeraBrand.accent,
          ],
          stops: <double>[0, 0.55, 1],
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: BaseeraBrand.primary.withValues(alpha: 0.35),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Icon(
        Icons.visibility_rounded,
        size: iconSize,
        color: Colors.white,
        shadows: const <Shadow>[
          Shadow(
            color: Color(0x40000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
    );
  }
}
