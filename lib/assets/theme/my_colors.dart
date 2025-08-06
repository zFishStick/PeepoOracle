import 'package:flutter/material.dart';
import 'package:animate_gradient/animate_gradient.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF0A0E21);
  static const Color accentColor = Color(0xFFEB1555);
  static const Color backgroundColor = Color(0xFF3a7d44); // Colore di sfondo statico
  static const Color cardColor = Color(0XFF9dc08b);
  static const Color textColor = Color(0XFFffffff);
  static const Color buttonColor = Color(0xFF4C4F5E);
  static const Color borderColor = Color(0xFF214526);
  static const Color shadowColor = Color(0x29000000); // 16% opacity black
  static final Color disabledButtonColor = Colors.deepPurple.shade900;
}

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimateGradient(
      primaryColors: [
        Colors.deepPurple.shade900,
        Colors.deepPurple.shade800,
      ],
      secondaryColors: [
        Colors.purple.shade400,
        Colors.purple.shade400,
      ],
      child: Container(),
    );
  }
}
