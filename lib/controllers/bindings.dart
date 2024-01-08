import './user.controller.dart';
import 'package:get/get.dart';

import './cow.controller.dart';
import './milking.controller.dart';
import './employee.controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CowsController>(() => CowsController());
    Get.lazyPut<MilkingController>(() => MilkingController());
    Get.lazyPut<UserController>(() => UserController());
    Get.lazyPut<EmployeeController>(() => EmployeeController());
  }
}
