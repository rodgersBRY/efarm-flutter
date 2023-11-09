import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  Future loginUser({
    required String email,
    required String password,
  }) async {
    _isLoading.value = true;

    final Map<String, String> data = {
      "email": email,
      "password": password,
    };

    try {
      final http.Response resp = await http.post(
        Uri.parse("https://efarm-api.vercel.app/api/v1/auth/login"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(data),
      );

      _isLoading.value = false;

      if (resp.statusCode == 200) {
        var jsonData = json.decode(resp.body);

        // save the token for automatic login
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("token", jsonData['token']);
        prefs.setString("username", jsonData['loadedUser']['username']);
        prefs.setString("role", jsonData['loadedUser']['role']);
      }

      return resp.statusCode;
    } catch (err) {
      _isLoading.value = false;

      Get.snackbar(
        "500",
        "Internal Server Error: $err",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: Icon(Icons.error, color: Colors.white),
      );

      // throw Exception(err);
    }
  }
}
