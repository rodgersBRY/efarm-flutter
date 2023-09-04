import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

Container titleContainer({required IconData icon, required String textTitle}) {
  return Container(
    color: AppColors.secondaryWhiteColor,
    padding: const EdgeInsets.all(5),
    child: Row(
      children: [
        Icon(
          icon,
          color: AppColors.accentWhiteColor,
        ),
        SizedBox(width: 6),
        Text(
          textTitle,
          style: TextStyle(color: AppColors.accentWhiteColor),
        ),
        Expanded(child: Container()),
        Icon(
          Icons.edit,
          color: AppColors.accentWhiteColor,
        ),
      ],
    ),
  );
}
