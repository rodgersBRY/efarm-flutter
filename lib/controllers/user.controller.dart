import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/user.model.dart';

class UserController extends GetxController {
  late UserModel user;
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  Future<void> login({required String email, required String password}) async {
    _isLoading.value = true;

    final Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
    };

    final Map<String, String> data = {
      "email": email,
      "password": password,
    };

    try {
      final http.Response resp = await http.post(
        Uri.parse("http://localhost:3000/api/v1/auth/login"),
        headers: requestHeaders,
        body: json.encode(data),
      );

      if (resp.statusCode == 200) {
        // store in shared service
        _isLoading.value = false;
        print("Response: ${resp.body}");
      } else {
        _isLoading.value = false;
        print("Request failed with status: ${resp.statusCode}");
      }
    } catch (err) {
      print(err);
      Get.snackbar(
        "Error",
        "Error logging in!",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: Icon(Icons.error, color: Colors.white),
      );
      _isLoading.value = false;
    }
  }
}
