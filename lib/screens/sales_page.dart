import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class SalesPage extends StatefulWidget {
  const SalesPage({super.key});

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Sales",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColors.primaryGreenColor,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
