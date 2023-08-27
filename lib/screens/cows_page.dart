import 'package:efarm/screens/cow_details_page.dart';
import 'package:efarm/screens/new_cow_page.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CowsPage extends StatelessWidget {
  const CowsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Cows"),
          backgroundColor: AppColors.primaryGreenColor,
          foregroundColor: Colors.white,
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          print("cow ${index + 1}");
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  CowDetailsScreen(cowName: 'Cow ${index + 1}'),
                            ),
                          );
                        },
                        leading: CircleAvatar(
                          child: Text("${index + 1}"),
                        ),
                        title: Text("Cow ${index + 1}"),
                        subtitle: Text("Cow Breed"),
                      );
                    }),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => NewCowPage()));
          },
          child: Icon(Icons.add),
          backgroundColor: AppColors.accentGreenColor,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
