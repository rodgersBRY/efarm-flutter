import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/icons_grid.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(
            "Smart Dairy",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: AppColors.primaryGreenColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Expanded(child: IconsGrid()),
            ],
          ),
        ),
      ),
    );
  }
}