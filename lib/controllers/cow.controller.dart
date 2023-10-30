import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/cow.model.dart';

class CowsController extends GetxController {
  List<CowModel> _cows = [];
  List<CowModel> _milkedCows = [];
  RxBool isLoading = false.obs;

  Future<List<CowModel>> getCows() async {
    try {
      final resp = await http
          .get(Uri.parse("https://efarm-api.vercel.app/api/v1/cows/"));

      if (resp.statusCode == 200) {
        final jsonData = json.decode(resp.body);

        _cows = List<CowModel>.generate(
            jsonData.length, (index) => CowModel.fromJson(jsonData[index]));
      }

      return _cows;
    } catch (err) {
      throw Exception(err);
    }
  }

  Future addCow({required CowModel cow}) async {
    isLoading.value = true;

    try {
      final resp = await http.post(
        Uri.parse("https://efarm-api.vercel.app/api/v1/cows/new-cow"),
        headers: {"Content-type": "application/json"},
        body: json.encode({
          "name": cow.name,
          "breed": cow.breed,
          "tagNo": cow.tagNo,
          "gender": cow.gender,
          "weight": cow.weight,
          "dob": cow.dob,
          "milked": cow.milked,
          "modeOfAcquiring": cow.modeOfAcquiring,
          "motherTag": cow.motherTag ?? "",
          "fatherTag": cow.fatherTag ?? "",
          "notes": cow.notes,
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
          "The cow information has been saved",
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

  Future<List<CowModel>> getMilkedCows() async {
    try {
      final resp = await http
          .get(Uri.parse("https://efarm-api.vercel.app/api/v1/cows/milked"));

      if (resp.statusCode == 200) {
        final jsonData = json.decode(resp.body);

        _milkedCows = List<CowModel>.generate(
            jsonData.length, (index) => CowModel.fromJson(jsonData[index]));
      }

      return _milkedCows;
    } catch (err) {
      throw Exception(err);
    }
  }

  Future deleteCow({required String cowId}) async {
    isLoading.value = true;

    try {
      final resp = await http
          .delete(Uri.parse("http://10.0.2.2:3000/api/v1/delete/$cowId"));

      isLoading.value = false;

      if (resp.statusCode == 204) {
        Get.snackbar("Success", "The record has been deleted");
      } else {
        print(resp.statusCode);
      }
    } catch (err) {
      isLoading.value = false;
      throw Exception(err);
    }
  }
}
