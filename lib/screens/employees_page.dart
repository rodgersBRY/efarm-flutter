import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class EmployeesPage extends StatelessWidget {
  const EmployeesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Employees",
          ),
          backgroundColor: AppColors.primaryGreenColor,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
