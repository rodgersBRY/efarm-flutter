import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class MilkPage extends StatelessWidget {
  const MilkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Milking",
          ),
          backgroundColor: AppColors.primaryGreenColor,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
