import 'package:flutter/material.dart';

import '../screens/screens.dart';
import '../utils/app_colors.dart';

class IconsGrid extends StatelessWidget {
  IconsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
        ),
        itemCount: _homeActions.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => _homeActions[index]['route']));
                  },
                  child: Container(
                    width: 150,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Image.asset(
                      _homeActions[index]["icon"],
                      fit: BoxFit.cover,
                      width: 80,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  _homeActions[index]["title"],
                  style: TextStyle(
                    color: AppColors.primaryBlueColor,
                  ),
                ),
              ],
            ),
          );
        });
  }

  final List _homeActions = [
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
}
