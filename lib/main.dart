import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './screens/homepage.dart';
import './utils/app_colors.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Dairy',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: AppColors.primaryBlueColor),
        useMaterial3: true,
      ),
      home: HomepageScreen(),
    );
  }
}
