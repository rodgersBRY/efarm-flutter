import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/appbar.dart';
import './cow_details_page.dart';
import './new_cow_page.dart';

class CowsPage extends StatelessWidget {
  const CowsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: myAppBar("My Cows"),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          print("cow tag ${index + 1}");
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  CowDetailsScreen(cowName: 'Cow ${index + 1}'),
                            ),
                          );
                        },
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image(
                            fit: BoxFit.cover,
                            width: 100,
                            image: AssetImage(
                              (index + 1) % 2 == 0
                                  ? "assets/cow.png"
                                  : "assets/bull.png",
                            ),
                          ),
                        ),
                        title: Text("Cow Name"),
                        subtitle: Text(
                          "Tag No",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 122, 122, 122)),
                        ),
                        trailing: Text(
                          (index + 1) % 2 == 0 ? "Female" : "Male",
                          style: TextStyle(color: Colors.grey),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: Text("Add Cow"),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => NewCowPage()));
          },
          icon: Icon(Icons.add),
          backgroundColor: AppColors.accentGreenColor,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
