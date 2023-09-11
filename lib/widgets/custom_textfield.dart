import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

Container customTextField({
  required String labelText,
  required TextEditingController textEditingController,
  required FocusNode focusNode,
  TextInputType? textInputType,
  int? maxLines,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: TextField(
      focusNode: focusNode,
      controller: textEditingController,
      keyboardType: textInputType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: AppColors.greyColor),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyColor),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  );
}
