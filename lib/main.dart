// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './controllers/bindings.dart';
import './screens/screens.dart';
import './utils/app_colors.dart';
import 'utils/check_authentication_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool isAuthenticated = await checkAuthentication();

  return runApp(MyApp(isAuthenticated: isAuthenticated));
}

class MyApp extends StatelessWidget {
  final bool isAuthenticated;
  MyApp({super.key, required this.isAuthenticated});

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
      initialRoute: isAuthenticated ? "/" : "/login",
      getPages: _pages,
    );
  }

  List<GetPage> _pages = [
    GetPage(
        name: "/", page: () => const HomepageScreen(), binding: MyBindings()),
    GetPage(
        name: "/login", page: () => const LoginPage(), binding: MyBindings()),
    GetPage(
        name: "/cows-page",
        page: () => const CowsPage(),
        binding: MyBindings()),
    GetPage(
      name: "/new-cow",
      page: () => NewCowPage(),
      binding: MyBindings(),
    ),
    GetPage(
        name: "/cow-details",
        page: () => CowDetailsScreen(),
        binding: MyBindings()),
    GetPage(
      name: "/milking-page",
      page: () => MilkPage(),
      binding: MyBindings(),
    ),
    GetPage(
      name: "/milk-record",
      page: () => MilkRecord(),
      binding: MyBindings(),
    ),
    GetPage(
      name: "/new-milk-record",
      page: () => NewMilkRecordPage(),
      binding: MyBindings(),
    ),
    GetPage(
      name: '/employees-page',
      page: () => EmployeesPage(),
      binding: MyBindings(),
    ),
  ];
}
