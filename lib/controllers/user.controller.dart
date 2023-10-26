import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.model.dart';

class UserController extends GetxController {
  late UserModel user;
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  Future login({required String email, required String password}) async {
    _isLoading.value = true;

    final Map<String, String> data = {
      "email": email,
      "password": password,
    };

    try {
      final http.Response resp = await http.post(
        Uri.parse("http://10.0.2.2:3000/api/v1/auth/login"),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(data),
      );

      _isLoading.value = false;

      if (resp.statusCode == 200) {
        var response = json.decode(resp.body);

        // save the token for automatic login
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("token", response['token']);
        prefs.setString("username", response['loadedUser']['username']);
      }

      return resp.statusCode;
    } catch (err) {
      _isLoading.value = false;

      Get.snackbar(
        "Error",
        "Error logging in!",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: Icon(Icons.error, color: Colors.white),
      );

      throw Exception(err);
    }
  }
}
