import 'package:efarm/controllers/cow.controller.dart';
import 'package:efarm/models/cow.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../widgets/appbar.dart';
import './new_cow_page.dart';

class CowsPage extends StatefulWidget {
  const CowsPage({super.key});

  @override
  State<CowsPage> createState() => _CowsPageState();
}

class _CowsPageState extends State<CowsPage> {
  late Future<List<CowModel>> _cowsBuilder;
  final CowsController _cowsController = Get.find();

  @override
  void initState() {
    super.initState();

    _cowsBuilder = _cowsController.getCows();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: myAppBar("My Cows"),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder<List<CowModel>>(
                    future: _cowsBuilder,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return Center(
                            child: CircularProgressIndicator(
                                color: AppColors.accentGreenColor),
                          );
                        default:
                          if (snapshot.hasError) {
                            return const Center(
                              child: Text("An error has occurred"),
                            );
                          } else {
                            List<CowModel> cows = snapshot.data!;

                            return ListView.separated(
                              separatorBuilder: (context, index) {
                                return Divider();
                              },
                              itemCount: cows.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () {
                                    Get.toNamed(
                                      '/cow-details',
                                      arguments: {"cow": cows[index]},
                                    );
                                  },
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Image(
                                      fit: BoxFit.cover,
                                      width: 100,
                                      image: AssetImage(
                                        cows[index].gender == "Female"
                                            ? "assets/cow.png"
                                            : "assets/bull.png",
                                      ),
                                    ),
                                  ),
                                  title: Text(cows[index].name),
                                  subtitle: Text(
                                    "${cows[index].tagNo}",
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 122, 122, 122)),
                                  ),
                                  trailing: Text(
                                    cows[index].gender,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                );
                              },
                            );
                          }
                      }
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
          backgroundColor: AppColors.primaryBlueColor.withOpacity(.9),
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
