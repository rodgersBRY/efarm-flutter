import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

AppBar myAppBar({required String title, bool? centerTitle}) {
  return AppBar(
    title: Text(title),
    backgroundColor: AppColors.primaryGreenColor,
    foregroundColor: Colors.white,
    centerTitle: centerTitle,
  );
}
