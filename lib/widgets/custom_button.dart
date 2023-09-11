import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

Container customButton({
  required BuildContext context,
  required RxBool isLoading,
  required VoidCallback func,
}) {
  return Container(
    width: MediaQuery.of(context).size.width * .6,
    child: Obx(() => ElevatedButton(
          onPressed: func,
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(AppColors.primaryBlueColor),
          ),
          child: isLoading.value
              ? CircularProgressIndicator(color: Colors.white)
              : Text(
                  'Save',
                  style: TextStyle(color: AppColors.accentWhiteColor),
                ),
        )),
  );
}
