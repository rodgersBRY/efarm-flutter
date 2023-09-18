import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class IconsGrid extends StatelessWidget {
  IconsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: _homeActions.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(_homeActions[index]['route']);
                  },
                  child: Container(
                    width: 150,
                    height: 140,
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
      "route": "/cows-page",
    },
    {
      "title": 'Milking',
      "icon": 'assets/milk.png',
      "route": "/milking-page",
    },
    {
      "title": 'Sales',
      "icon": 'assets/sales.png',
      "route": "/sales-page",
    },
    {
      "title": 'My Employees',
      "icon": 'assets/employees.png',
      "route": "/employee-page",
    },
    {
      "title": 'Breeding',
      "icon": 'assets/breed.png',
      "route": "/breeding-page",
    },
  ];
}
