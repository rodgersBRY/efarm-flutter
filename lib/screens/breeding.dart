import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class BreedingPage extends StatelessWidget {
  const BreedingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Breeding",
          ),
          backgroundColor: AppColors.primaryGreenColor,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
