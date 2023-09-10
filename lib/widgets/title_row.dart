import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

Container titleContainer({
  required IconData icon,
  required String textTitle,
  required VoidCallback onClick,
}) {
  return Container(
    height: 35,
    color: AppColors.primaryBlueColor,
    padding: const EdgeInsets.all(5),
    child: Row(
      children: [
        Icon(
          Icons.info,
          color: AppColors.accentWhiteColor,
          size: 12,
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
            icon,
            color: AppColors.accentWhiteColor,
            size: 12,
          ),
        ),
      ],
    ),
  );
}
