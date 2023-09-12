import 'package:efarm/controllers/milking.controller.dart';
import 'package:efarm/models/milking.model.dart';
import 'package:efarm/utils/app_colors.dart';
import 'package:efarm/widgets/appbar.dart';
import 'package:efarm/widgets/error_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MilkRecord extends StatefulWidget {
  const MilkRecord({super.key});

  @override
  State<MilkRecord> createState() => _MilkRecordState();
}

class _MilkRecordState extends State<MilkRecord> {
  MilkingController _milkingController = Get.find();
  String appTitle = Get.arguments['appTitle'];
  var tagNo = Get.arguments['tagNo'];

  late Future<List<MilkingModel>> _milkingFuture;

  @override
  void initState() {
    super.initState();

    _milkingFuture = _milkingController.getCowMilkRecords(tagNo: tagNo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(appTitle),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.secondaryWhiteColor),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Obx(() => Text(
                    "Total Yield: ${_milkingController.totalYield.value}L",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            ),
            FutureBuilder<List<MilkingModel>>(
                future: _milkingFuture,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.accentGreenColor,
                          ),
                        ),
                      );
                    default:
                      if (snapshot.hasError) {
                        return customErrorWidget();
                      } else {
                        List<MilkingModel> records = snapshot.data!;

                        return Expanded(
                          child: ListView.builder(
                            itemCount: records.length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 1,
                                child: ExpansionTile(
                                  title: Text(records[index].dateTime),
                                  childrenPadding: const EdgeInsets.all(15),
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Yield: ${records[index].yield}L",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          "Yield on Calf: ${records[index].yieldOnCalf}L",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Comments: ${records[index].observations}",
                                      softWrap: true,
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 94, 94, 94)),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }
                  }
                }),
          ],
        ),
      ),
    );
  }
}
