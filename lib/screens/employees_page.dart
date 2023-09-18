import 'package:flutter/material.dart';

import '../widgets/appbar.dart';

class EmployeesPage extends StatelessWidget {
  const EmployeesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: myAppBar(title: "My Employees"),
      ),
    );
  }
}
