import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

Expanded customErrorWidget() {
  return Expanded(
      child: Center(
          child: Text(
    "An error has occurred",
    style: TextStyle(
      color: AppColors.secondaryWhiteColor,
      fontSize: 20,
    ),
  )));
}
