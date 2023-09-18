import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/milking.model.dart';

class MilkingController extends GetxController {
  RxBool isLoading = false.obs;
  List<MilkingModel> _cowMilkRecords = [];
  RxInt totalYield = 0.obs;

  Future addMilkRecord({required Map<String, dynamic> record}) async {
    isLoading.value = true;
    try {
      final resp = await http.post(
        Uri.parse("http://10.0.2.2:3000/api/v1/milking/new"),
        headers: {"Content-type": "application/json"},
        body: json.encode({
          "tagNo": record['tagNo'],
          "yield": record['yield'],
          "yieldOnCalf": record['yieldOnCalf'],
          "observations":
              record['observations'] != "" ? record['observations'] : null,
        }),
      );

      if (resp.statusCode == 201) {
        isLoading.value = false;
        Get.snackbar(
          backgroundColor: Colors.white,
          icon: Icon(
            Icons.check,
            color: Colors.green,
          ),
          "Success",
          "The record has been saved",
        );
      } else {
        isLoading.value = false;
      }
    } catch (err) {
      isLoading.value = false;
      Get.snackbar("Error", "Error saving the details");
      throw Exception(err);
    }
  }

  Future<List<MilkingModel>> getCowMilkRecords({required int tagNo}) async {
    try {
      final resp = await http
          .get(Uri.parse("http://10.0.2.2:3000/api/v1/milking/$tagNo"));

      if (resp.statusCode == 200) {
        final jsonData = json.decode(resp.body);

        _cowMilkRecords = List<MilkingModel>.generate(
            jsonData.length, (index) => MilkingModel.fromJson(jsonData[index]));

        totalYield.value =
            _cowMilkRecords.fold(0, (int sum, MilkingModel json) {
          int yield = json.yield;
          return sum + yield;
        });

        print("total yield: $totalYield");
      }

      return _cowMilkRecords;
    } catch (err) {
      throw Exception(err);
    }
  }
}
