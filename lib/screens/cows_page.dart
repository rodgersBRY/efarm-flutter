import 'package:efarm/widgets/error_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cow.controller.dart';
import '../models/cow.model.dart';
import '../utils/app_colors.dart';
import '../widgets/appbar.dart';

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
    return Scaffold(
      appBar: myAppBar(title: "My Cows"),
      body: Column(
        children: [
          SizedBox(height: 5),
          FutureBuilder<List<CowModel>>(
              future: _cowsBuilder,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                            color: AppColors.accentGreenColor),
                      ),
                    );
                  default:
                    if (snapshot.hasError) {
                      return customErrorWidget();
                    } else {
                      List<CowModel> cows = snapshot.data!;
                      if (cows.length == 0) {
                        return Expanded(
                          child: Center(
                            child: Text(
                              "There are no cows on the system",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                          ),
                        );
                      } else {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: cows.length,
                            itemBuilder: (context, index) {
                              return Card(
                                color: Colors.white,
                                elevation:
                                    1, // Add elevation for a shadow effect
                                margin: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  onTap: () {
                                    Get.offNamed(
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
                                ),
                              );
                            },
                          ),
                        );
                      }
                    }
                }
              })
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Add Cow"),
        onPressed: () {
          Get.toNamed("/new-cow");
        },
        icon: Icon(Icons.add),
        backgroundColor: AppColors.primaryBlueColor.withOpacity(.9),
        foregroundColor: Colors.white,
      ),
    );
  }
}
