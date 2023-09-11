import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/cow.model.dart';
import '../widgets/title_row.dart';

class CowDetailsScreen extends StatelessWidget {
  const CowDetailsScreen({super.key});

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
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete, color: Colors.white),
                        )
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
