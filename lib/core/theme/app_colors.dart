import 'package:flutter/material.dart';

//
class AppColors {
  // Main Background Gradient
  static const Gradient backgroundGradient = LinearGradient(
    colors: [Color(0xFF000F33), Color(0xFF000F33), Color(0xFF070707)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Card Colors
  static const Color cardBackground = Color.fromRGBO(255, 255, 255, 0.05);
  static const Color cardBorder = Colors.white;

  // Primary Colors (from your tailwind config)
  static const Color primaryBase = Color.fromRGBO(2, 73, 254, 0.30);
  static const Color primary30 = Color.fromRGBO(128, 164, 254, 0.30);
  static const Color primary40 = Color(0xFF5686FE);
  static const Color primary10 = Color(0xFFCCDBFF);

  // Neutral Colors
  static const Color neutral70 = Color(0xFF070707);

  // Blue Colors
  static const Color blueChallenge = Color(0xFF1456FE);
  static const Color blueBadge = Color(0xFF80A4FE);
  static const Color blueMaster = Color(0xFF4652BB);
  static const Color blueEvaluation = Color(0xFF5865F2);

  // Green Colors
  static const Color greenFunded = Color(0xFF75DFA7);
  static const Color greenFundedBg = Color(0xFF053321);

  // Dark Colors
  static const Color darkNavy = Color(0xFF11285F);

  // Button Colors
  static const Color dashboardButtonBorder = Color.fromRGBO(255, 255, 255, 0.1);

  // Gradients
  static const Gradient proBadgeTextGradient = LinearGradient(
    colors: [primary40, primary10],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const Gradient proBadgeBgGradient = LinearGradient(
    colors: [primaryBase, primary30],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const Gradient evaluationBadgeGradient = LinearGradient(
    colors: [
      Color.fromRGBO(88, 101, 242, 0.7),
      Color.fromRGBO(88, 101, 242, 0.28),
    ],
  );

  static const Gradient masterBadgeGradient = LinearGradient(
    colors: [blueMaster, blueMaster],
  );

  static const Gradient dashboardButtonGradient = LinearGradient(
    colors: [Colors.white, primary10],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
// --- Primary Blues ---
  static const Color primaryBlue = Color(0xFF1456FE);
  static const Color lightSkyBlue = Color(0xFF80A4FE);
  static const Color discordPurple = Color(0xFF5865F2);
  static const Color mutedPurpleBlue = Color(0xFF4652BB);

  // --- Dark Blues & Surfaces ---
  static const Color background = Color(0xFF0D1B2A); // Assumed main background
  static const Color surface = Color(0xFF1B263B); // Card background
  static const Color navyBlue = Color(0xFF11285F);
  static const Color midnightBlue = Color(0xFF020E2C);

  // --- Greens ---
  static const Color mintGreen = Color(0xFF75DFA7);
  static const Color darkForestGreen = Color(0xFF053321);

  // --- Neutrals ---
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  // Text Colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary =
      Color(0xB3FFFFFF); // White with 70% opacity
}
