import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

AppBar myAppBar(String title) {
  return AppBar(
    title: Text(title),
    backgroundColor: AppColors.primaryGreenColor,
    foregroundColor: Colors.white,
  );
}
