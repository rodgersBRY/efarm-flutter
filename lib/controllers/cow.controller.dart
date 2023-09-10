import 'dart:convert';

import '../models/cow.model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CowsController extends GetxController {
  List<CowModel> _cows = [];

  Future<List<CowModel>> getCows() async {
    try {
      final resp =
          await http.get(Uri.parse("http://10.0.2.2:3000/api/v1/cows/"));

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
    final resp = await http.post(
      Uri.parse("http://10.0.2.2:3000/api/v1/cows/new-cow"),
      headers: {"Content-type": "application/json"},
      body: json.encode({"cow": cow}),
    );

    Map<String, dynamic> jsonData = json.decode(resp.body);
    if (resp.statusCode == 201) {
      print(jsonData);
    }
  }
}
