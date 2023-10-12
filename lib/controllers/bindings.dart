import 'package:efarm/controllers/cow.controller.dart';
import 'package:efarm/controllers/milking.controller.dart';
import 'package:efarm/controllers/user.controller.dart';
import 'package:get/get.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CowsController>(() => CowsController());
    Get.lazyPut<MilkingController>(() => MilkingController());
    Get.lazyPut<UserController>(() => UserController());
  }
}
