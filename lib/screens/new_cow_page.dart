import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/cow.controller.dart';
import '../models/cow.model.dart';
import '../utils/app_colors.dart';
import '../widgets/appbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_dropdown.dart';
import '../widgets/custom_textfield.dart';

const List<String> breedList = [
  'Breed Type',
  'Bull',
  'Cow',
  'Calf',
];

const List<String> acquireList = [
  "Bought",
  "Born",
];

const List<String> genderList = [
  "Male",
  "Female",
];

// ignore: must_be_immutable
class NewCowPage extends StatefulWidget {
  bool? isEditing;

  NewCowPage({super.key, this.isEditing = false});

  @override
  State<NewCowPage> createState() => _NewCowPageState();
}

class _NewCowPageState extends State<NewCowPage> {
  DateTime selectedDate = DateTime.now();
  final _cowsController = CowsController();

  final nameController = TextEditingController();
  final tagNoController = TextEditingController();
  TextEditingController? motherTagController = new TextEditingController();
  TextEditingController? fatherTagController = new TextEditingController();
  final weightController = TextEditingController();
  final notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  final nameNode = FocusNode();
  final breedNode = FocusNode();
  final tagNoNode = FocusNode();
  final weightNode = FocusNode();
  final fatherTagNode = FocusNode();
  final motherTagNode = FocusNode();
  final notesNode = FocusNode();

  // Initial Selected Value
  String breedDropdownValue = 'Breed Type';
  String acquireDropdownValue = "Bought";
  String genderDropdownValue = "Female";

  // List of items in our dropdown menu
  String breedValue = breedList.first;
  String acquireValue = acquireList.first;
  String genderValue = genderList.first;

  // switch if the cow is being milked or not
  RxBool isMilked = false.obs;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000, 1),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  _addCow() async {
    if (nameController.text.isEmpty ||
        tagNoController.text.isEmpty ||
        weightController.text.isEmpty) {
      Get.snackbar(
          backgroundColor: Colors.red,
          colorText: Colors.white,
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          "Error",
          "Please fill in all the fields before submitting");
    } else {
      // convert DateTime to String
      final dateStr = DateFormat('yyy-MM-dd').format(selectedDate);

      var newCow = {
        "name": nameController.text.trim(),
        "breed": breedValue,
        "tagNo": int.parse(tagNoController.text.trim()),
        "weight": int.parse(weightController.text.trim()),
        "gender": genderValue,
        "dob": dateStr,
        "milked": isMilked.value,
        "modeOfAcquiring": acquireDropdownValue,
        "motherTag": (motherTagController!.text.trim().isNotEmpty)
            ? int.tryParse(motherTagController!.text.trim())
            : null,
        "fatherTag": (fatherTagController!.text.trim().isNotEmpty)
            ? int.tryParse(fatherTagController!.text.trim())
            : null,
        "notes": notesController.text.trim(),
      };

      await _cowsController.addCow(cow: CowModel.fromJson(newCow));

      Get.offNamed("/cows-page");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        nameNode.unfocus();
        breedNode.unfocus();
        tagNoNode.unfocus();
        weightNode.unfocus();
        fatherTagNode.unfocus();
        motherTagNode.unfocus();
        notesNode.unfocus();
      },
      child: Scaffold(
        appBar: myAppBar("Add Cow"),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(height: 20),
                customDropdown(
                  context: context,
                  defaultValue: breedValue,
                  list: breedList,
                  onChanged: (val) {
                    setState(() {
                      breedValue = val!;
                    });
                  },
                ),
                customTextField(
                    focusNode: nameNode,
                    textEditingController: nameController,
                    labelText: "Name"),
                customTextField(
                    focusNode: tagNoNode,
                    textEditingController: tagNoController,
                    labelText: "Tag No"),
                customTextField(
                    focusNode: weightNode,
                    textEditingController: weightController,
                    labelText: "Weight"),
                customDropdown(
                  context: context,
                  defaultValue: genderValue,
                  list: genderList,
                  onChanged: (val) {
                    setState(() {
                      genderValue = val!;
                    });
                  },
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${selectedDate.toLocal()}".split(' ')[0]),
                      SizedBox(height: 5),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              AppColors.accentWhiteColor),
                          foregroundColor: MaterialStateProperty.all(
                              AppColors.primaryGreenColor),
                        ),
                        onPressed: () => _selectDate(context),
                        child: const Text("Date of Birth"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text("Milked"),
                      SizedBox(width: 20),
                      Obx(() => Switch(
                          activeColor: AppColors.accentGreenColor,
                          value: isMilked.value,
                          onChanged: (bool val) {
                            isMilked.value = val;
                          })),
                    ],
                  ),
                ),
                customDropdown(
                  context: context,
                  defaultValue: acquireValue,
                  list: acquireList,
                  onChanged: (val) {
                    setState(() {
                      acquireValue = val!;
                    });
                  },
                ),
                customTextField(
                    focusNode: motherTagNode,
                    textEditingController: motherTagController!,
                    labelText: "Mother's Tag No"),
                customTextField(
                    focusNode: fatherTagNode,
                    textEditingController: fatherTagController!,
                    labelText: "Father's Tag No"),
                customTextField(
                  labelText: "Notes (optional)",
                  textEditingController: notesController,
                  focusNode: notesNode,
                  maxLines: 3,
                  textInputType: TextInputType.multiline,
                ),
                SizedBox(height: 15),
                customButton(
                  context: context,
                  isLoading: _cowsController.isLoading,
                  func: _addCow,
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    nameController.dispose();
    tagNoController.dispose();
    weightController.dispose();
    motherTagController!.dispose();
    fatherTagController!.dispose();
  }
}
