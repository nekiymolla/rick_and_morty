import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class TextStyles {
  static TextStyle mainText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.textColor,
    fontFamily: GoogleFonts.unbounded().fontFamily,
  );
  static TextStyle statusText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
    fontFamily: GoogleFonts.unbounded().fontFamily,
  );
  static TextStyle descriptionText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
    fontFamily: GoogleFonts.unbounded().fontFamily,
  );
}
