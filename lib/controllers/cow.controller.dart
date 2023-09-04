import 'package:efarm/models/cow.model.dart';
import 'package:get/get.dart';

class CowsController extends GetxController {
  List<CowModel> _cows = [
    CowModel(
      breed: "Aryshire",
      name: "Joan",
      tagNo: 23,
      gender: "Female",
      weight: 300,
      dob: "2022-10-12",
      modeOfAcquiring: "Born",
      notes: "",
    ),
    CowModel(
      breed: "Freisian",
      name: "Mary",
      tagNo: 1,
      gender: "Female",
      weight: 267,
      dob: "2023-01-02",
      modeOfAcquiring: "Bought",
      notes: "",
    ),
    CowModel(
      breed: "Weaner",
      name: "J",
      tagNo: 10,
      gender: "Male",
      weight: 301,
      dob: "2022-01-02",
      modeOfAcquiring: "Born",
      notes: "Has a black eye deficiency",
    ),
  ];

  Future<List<CowModel>> getCows() async {
    List<CowModel> cows = _cows;

    await Future.delayed(Duration(seconds: 2));

    return cows;
  }
}
