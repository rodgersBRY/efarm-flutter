// ignore_for_file: must_be_immutable

import 'package:efarm/controllers/bindings.dart';
import 'package:efarm/screens/auth/login.dart';
import 'package:efarm/screens/cow_details_page.dart';
import 'package:efarm/screens/milk_record_page.dart';
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
      initialRoute: "/login",
      getPages: _pages,
    );
  }

  List<GetPage> _pages = [
    GetPage(
        name: "/login", page: () => const LoginPage(), binding: MyBindings()),
    GetPage(
        name: "/", page: () => const HomepageScreen(), binding: MyBindings()),
    GetPage(
        name: "/cows-page",
        page: () => const CowsPage(),
        binding: MyBindings(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: "/new-cow",
        page: () => NewCowPage(),
        binding: MyBindings(),
        transition: Transition.downToUp),
    GetPage(
        name: "/cow-details",
        page: () => const CowDetailsScreen(),
        binding: MyBindings(),
        transition: Transition.fadeIn),
    GetPage(
        name: "/milking-page",
        page: () => MilkPage(),
        binding: MyBindings(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: "/milk-record",
        page: () => MilkRecord(),
        binding: MyBindings(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: "/new-milk-record",
        page: () => NewMilkRecordPage(),
        binding: MyBindings(),
        transition: Transition.downToUp),
    GetPage(
        name: "/sales-page",
        page: () => SalesPage(),
        binding: MyBindings(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: "/employee-page",
        page: () => EmployeesPage(),
        binding: MyBindings(),
        transition: Transition.rightToLeftWithFade),
  ];
}
