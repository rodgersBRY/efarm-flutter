import 'package:efarm/controllers/cow.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/cow.model.dart';
import '../utils/app_colors.dart';
import '../widgets/title_row.dart';

class CowDetailsScreen extends StatefulWidget {
  CowDetailsScreen({super.key});

  @override
  State<CowDetailsScreen> createState() => _CowDetailsScreenState();
}

class _CowDetailsScreenState extends State<CowDetailsScreen> {
  CowsController _cowsController = Get.find();
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

  String formatDate(String date) {
    return DateFormat.yMMM().format(DateTime.parse(date));
  }

  String calculateAge(String date) {
    DateTime currentDate = DateTime.now();
    DateTime birthDate = DateTime.parse(date);

    int ageYears = currentDate.year - birthDate.year;
    int ageMonths = currentDate.month - birthDate.month;

    if (currentDate.day < birthDate.day) {
      ageMonths--;
      final daysInLastMonth =
          DateTime(currentDate.year, currentDate.month - 1, 0).day;
      ageMonths += daysInLastMonth;
    }

    if (ageMonths < 0) {
      ageYears--;
      ageMonths += 12;
    }

    String age = '';

    if (ageYears > 0) {
      age += '$ageYears ${ageYears == 1 ? 'year' : 'years'}';
    }

    if (ageMonths > 0) {
      if (ageYears > 0) {
        age += ', ';
      }
      age += '$ageMonths ${ageMonths == 1 ? 'month' : 'months'}';
    }

    return age.toString();
  }

  deleteCow(int cowTag) async {
    var response = await _cowsController.deleteCow(cowTag: cowTag);

    if (response == 204) {
      Navigator.of(context).pop();
      Get.snackbar(
        "Success",
        "The record has been deleted",
        icon: Icon(Icons.check_circle_outline),
        backgroundColor: Colors.white,
      );
      Get.offNamed('/cows-page');
    } else {
      Navigator.of(context).pop();
      Get.snackbar(
        "Error",
        "Failed to delete the record",
        colorText: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    CowModel cow = Get.arguments['cow'];

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .3,
              padding: const EdgeInsets.only(top: 5, right: 10, bottom: 10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/cow_bg.jpg"),
                fit: BoxFit.cover,
              )),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          color: Colors.white,
                          onPressed: () {
                            Get.offNamed("/cows-page");
                          },
                          icon: Icon(Icons.arrow_back),
                        ),
                        SizedBox(width: 5),
                        Text(
                          cow.name,
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        Expanded(child: Container()),
                        role == 'admin'
                            ? IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(
                                              "Are you sure you want to delete?"),
                                          actions: [
                                            TextButton(
                                              style: ButtonStyle(
                                                foregroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.grey),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Cancel"),
                                            ),
                                            Obx(() => TextButton(
                                                  style: ButtonStyle(
                                                    foregroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(AppColors
                                                                .primaryGreenColor),
                                                  ),
                                                  onPressed: () =>
                                                      deleteCow(cow.tagNo),
                                                  child: _cowsController.loading
                                                      ? CircularProgressIndicator(
                                                          color: AppColors
                                                              .accentGreenColor)
                                                      : Text("Delete"),
                                                )),
                                          ],
                                        );
                                      });
                                },
                                icon: Icon(Icons.delete, color: Colors.white),
                              )
                            : Container()
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${cow.tagNo}",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titleContainer(
                        icon: Icons.edit,
                        textTitle: "General Details",
                        onClick: () {
                          Get.toNamed("/new-cow", arguments: {"cow": cow});
                        },
                      ),
                      _customText("Tag No: ${cow.tagNo}"),
                      _customText("Name: ${cow.name}"),
                      _customText("D.O.B: ${formatDate(cow.dob)}"),
                      _customText("Age: ${calculateAge(cow.dob)}"),
                      _customText("Gender: ${cow.gender}"),
                      _customText("Breed: ${cow.breed}"),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Milked: ${cow.milked ? 'YES' : 'NO'}",
                          style: TextStyle(
                            fontSize: 18,
                            color: cow.milked
                                ? AppColors.accentGreenColor
                                : Colors.red,
                          ),
                        ),
                      ),
                      cow.motherTag != null
                          ? _customText("Mother's Tag: ${cow.motherTag}")
                          : Container(),
                      cow.fatherTag != null
                          ? _customText("Bull's Tag: ${cow.fatherTag}")
                          : Container(),
                      _customText("Mode of Acquiring: ${cow.modeOfAcquiring}"),
                      cow.notes != null
                          ? _customText("Notes: ${cow.notes}")
                          : Container(),
                      titleContainer(
                        icon: Icons.lan,
                        textTitle: "Offspring Details",
                        onClick: () {},
                      ),
                      cow.offspring != null
                          ? ListView.builder(
                              shrinkWrap:
                                  true, // important to avoid rendering issues
                              itemCount: cow.offspring!.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: CircleAvatar(),
                                  title: Text(cow.offspring![index]['tagNo']
                                      .toString()),
                                  subtitle: Text(cow.offspring![index]['name']),
                                );
                              })
                          : Container()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _customText(String text) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: const Color.fromARGB(255, 78, 78, 78),
        ),
      ),
    );
  }
}
