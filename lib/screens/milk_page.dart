import 'package:efarm/controllers/cow.controller.dart';
import 'package:efarm/models/cow.model.dart';
import 'package:efarm/widgets/error_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../widgets/appbar.dart';

class MilkPage extends StatefulWidget {
  const MilkPage({super.key});

  @override
  State<MilkPage> createState() => _MilkPageState();
}

class _MilkPageState extends State<MilkPage> {
  late Future<List<CowModel>> _cowsFuture;
  CowsController _cowsController = Get.find();

  @override
  void initState() {
    super.initState();

    _cowsFuture = _cowsController.getMilkedCows();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: "Milk Records"),
      body: Column(
        children: [
          SizedBox(height: 5),
          FutureBuilder<List<CowModel>>(
              future: _cowsFuture,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Expanded(
                      child: Center(
                          child: CircularProgressIndicator(
                        color: AppColors.accentGreenColor,
                      )),
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
                              "There are no cows being milked",
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
                                    Get.toNamed(
                                      "/milk-record",
                                      arguments: {
                                        "appTitle": cows[index].name,
                                        "tagNo": cows[index].tagNo,
                                      },
                                    );
                                  },
                                  title: Text(
                                    '${cows[index].name}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Tag Number: ${cows[index].tagNo}'),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    }
                }
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("New Record"),
        onPressed: () {
          Get.toNamed("/new-milk-record");
        },
        icon: Icon(Icons.add),
        backgroundColor: AppColors.primaryBlueColor.withOpacity(.9),
        foregroundColor: Colors.white,
      ),
    );
  }
}
