// ignore_for_file: must_be_immutable

import 'package:efarm/controllers/bindings.dart';
import 'package:efarm/screens/cow_details_page.dart';
import 'package:efarm/screens/new_milk_record_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './screens/screens.dart';
import './utils/app_colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

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
      initialRoute: "/",
      getPages: _pages,
    );
  }

  List<GetPage> _pages = [
    GetPage(
        name: "/", page: () => const HomepageScreen(), binding: MyBindings()),
    GetPage(
        name: "/cows-page",
        page: () => const CowsPage(),
        binding: MyBindings()),
    GetPage(name: "/new-cow", page: () => NewCowPage(), binding: MyBindings()),
    GetPage(
        name: "/cow-details",
        page: () => const CowDetailsScreen(),
        binding: MyBindings()),
    GetPage(
        name: "/milking-page", page: () => MilkPage(), binding: MyBindings()),
    GetPage(
        name: "/new-milk-record",
        page: () => NewMilkRecordPage(),
        binding: MyBindings()),
  ];
}
