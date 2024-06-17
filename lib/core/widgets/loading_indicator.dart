import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';

Widget loadingIndicator() {
  return Center(
    child: CircularProgressIndicator(
      color: AppColors.plateColor,
    ),
  );
}
