import 'package:flutter/material.dart';

import '../widgets/appbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_dropdown.dart';
import '../widgets/custom_textfield.dart';

const List<String> breedList = [
  'Breed Type',
  'Friesian',
  'Arshire',
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
  final breedController = TextEditingController();
  final nameController = TextEditingController();
  final tagNoController = TextEditingController();
  final motherTagController = TextEditingController();
  final fatherTagController = TextEditingController();
  final weightController = TextEditingController();
  final dobController = TextEditingController();
  final entryDateController = TextEditingController();
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
  final dobNode = FocusNode();
  final entryDateNode = FocusNode();
  final notesNode = FocusNode();

  // Initial Selected Value
  String breedDropdownValue = 'Breed Type';
  String acquireDropdownValue = "Bought";
  String genderDropdownValue = "Female";

  // List of items in our dropdown menu
  String breedValue = breedList.first;
  String acquireValue = acquireList.first;
  String genderValue = genderList.first;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          nameNode.unfocus();
          breedNode.unfocus();
          tagNoNode.unfocus();
          weightNode.unfocus();
          fatherTagNode.unfocus();
          motherTagNode.unfocus();
          dobNode.unfocus();
          entryDateNode.unfocus();
          notesNode.unfocus();
        },
        child: Scaffold(
          appBar: myAppBar("Add Cow"),
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
                  SizedBox(height: 10),
                  customTextField(
                      focusNode: nameNode,
                      controller: nameController,
                      hintText: "Name"),
                  customTextField(
                      focusNode: tagNoNode,
                      controller: tagNoController,
                      hintText: "Tag No"),
                  customTextField(
                      focusNode: weightNode,
                      controller: weightController,
                      hintText: "Weight"),
                  SizedBox(height: 10),
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
                  SizedBox(height: 10),
                  customTextField(
                      focusNode: dobNode,
                      controller: dobController,
                      hintText: "Date of Birth"),
                  customTextField(
                      focusNode: entryDateNode,
                      controller: entryDateController,
                      hintText: "Date of Entry on the farm"),
                  SizedBox(height: 10),
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
                  SizedBox(height: 10),
                  customTextField(
                      focusNode: motherTagNode,
                      controller: motherTagController,
                      hintText: "Mother's Tag No"),
                  SizedBox(height: 10),
                  customTextField(
                      focusNode: fatherTagNode,
                      controller: fatherTagController,
                      hintText: "Father's Tag No"),
                  SizedBox(height: 25),
                  customButton("Add", context),
                  SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
