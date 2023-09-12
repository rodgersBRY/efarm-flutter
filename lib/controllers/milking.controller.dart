import 'dart:convert';

import 'package:efarm/models/milking.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MilkingController extends GetxController {
  RxBool isLoading = false.obs;
  List<MilkingModel> _cowMilkRecords = [];

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

  Future<List<MilkingModel>> getCowMilkRecords() async {
    try {
      return _cowMilkRecords;
    } catch (err) {
      throw Exception(err);
    }
  }
}
