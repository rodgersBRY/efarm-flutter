import 'dart:convert';

import 'package:efarm/models/employee.model.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class EmployeeController extends GetxController {
  RxBool _isLoading = false.obs;
  List<Employee> _employees = [];

  List<Employee> get employees => _employees;
  bool get loading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();

    fetchEmployees();
  }

  Future fetchEmployees() async {
    try {
      final resp =
          await http.get(Uri.parse("http://10.0.2.2:3000/api/v1/employees/"));

      if (resp.statusCode == 200) {
        final jsonData = json.decode(resp.body);

        _employees = List<Employee>.generate(
            jsonData.length, (index) => Employee.fromJson(jsonData[index]));
      }

      print(_employees);
      
      return _employees;
    } catch (err) {
      throw Exception(err);
    }
  }
}
