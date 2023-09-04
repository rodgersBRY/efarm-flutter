import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

Container titleContainer({
  required IconData icon,
  required String textTitle,
  required VoidCallback onClick,
}) {
  return Container(
    color: AppColors.primaryBlueColor,
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
        IconButton(
          onPressed: onClick,
          icon: Icon(
            Icons.edit,
            color: AppColors.accentWhiteColor,
          ),
        ),
      ],
    ),
  );
}
