import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

Widget customButton(String label, BuildContext context) {
  return InkWell(
    onTap: () {},
    child: Container(
      width: MediaQuery.of(context).size.width * .7,
      height: 60,
      decoration: BoxDecoration(
          color: AppColors.accentGreenColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Center(
          child: Text(
        label,
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      )),
    ),
  );
}
