import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CowDetailsScreen extends StatelessWidget {
  final String cowName;
  const CowDetailsScreen({super.key, required this.cowName});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(cowName),
        backgroundColor: AppColors.primaryGreenColor,
        foregroundColor: Colors.white,
      ),
    ));
  }
}
