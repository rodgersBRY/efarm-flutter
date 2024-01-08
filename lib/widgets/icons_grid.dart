import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/screens.dart';
import '../utils/app_colors.dart';

class IconsGrid extends StatefulWidget {
  IconsGrid({super.key});

  @override
  State<IconsGrid> createState() => _IconsGridState();
}

class _IconsGridState extends State<IconsGrid> {
  String? role;

  @override
  void initState() {
    super.initState();

    checkUserRole();
  }

  Future checkUserRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      role = prefs.getString("role");
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
        ),
        itemCount: role != 'admin' ? _userActions.length : adminActions.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => role != 'admin'
                          ? _userActions[index]['route']
                          : adminActions[index]['route'],
                    ));
                  },
                  child: Container(
                    width: 150,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Image.asset(
                      role != 'admin'
                          ? _userActions[index]["icon"]
                          : adminActions[index]["icon"],
                      fit: BoxFit.cover,
                      width: 80,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  role != 'admin'
                      ? _userActions[index]["title"]
                      : adminActions[index]["title"],
                  style: TextStyle(
                    color: AppColors.primaryBlueColor,
                  ),
                ),
              ],
            ),
          );
        });
  }

  final List adminActions = [
    {
      "title": 'Cows',
      "icon": 'assets/cows.png',
      "route": CowsPage(),
    },
    {
      "title": 'Milking',
      "icon": 'assets/milk.png',
      "route": MilkPage(),
    },
    {
      "title": 'Breeding',
      "icon": 'assets/breed.png',
      "route": BreedingPage(),
    },
    {
      "title": 'Sales',
      "icon": 'assets/sales.png',
      "route": SalesPage(),
    },
    {
      "title": 'My Employees',
      "icon": 'assets/employees.png',
      "route": EmployeesPage(),
    },
  ];

  final List _userActions = [
    {
      "title": 'Cows',
      "icon": 'assets/cows.png',
      "route": CowsPage(),
    },
    {
      "title": 'Milking',
      "icon": 'assets/milk.png',
      "route": MilkPage(),
    },
    {
      "title": 'Breeding',
      "icon": 'assets/breed.png',
      "route": BreedingPage(),
    },
  ];
}
