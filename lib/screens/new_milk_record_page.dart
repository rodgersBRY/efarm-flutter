import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/milking.controller.dart';
import '../widgets/appbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class NewMilkRecordPage extends StatefulWidget {
  @override
  _NewMilkRecordPageState createState() => _NewMilkRecordPageState();
}

class _NewMilkRecordPageState extends State<NewMilkRecordPage> {
  MilkingController _milkingController = Get.find();

  TextEditingController tagNoController = TextEditingController();
  TextEditingController yieldController = TextEditingController();
  TextEditingController yieldOnCalfController = TextEditingController();
  TextEditingController observationsController = TextEditingController();

  FocusNode yieldOnCalfNode = new FocusNode();
  FocusNode yieldNode = new FocusNode();
  FocusNode tagNoNode = new FocusNode();
  FocusNode observationsNode = new FocusNode();

  void _submitData() async {
    if (tagNoController.text.isEmpty ||
        yieldController.text.isEmpty ||
        yieldOnCalfController.text.isEmpty) {
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
      var newRecord = {
        "tagNo": tagNoController.text.trim(),
        "yield": yieldController.text.trim(),
        "yieldOnCalf": yieldOnCalfController.text.trim(),
        "observations": observationsController.text.trim(),
      };

      await _milkingController.addMilkRecord(record: newRecord);

      Get.offNamed("/milking-page");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        tagNoNode.unfocus();
        yieldNode.unfocus();
        yieldOnCalfNode.unfocus();
        observationsNode.unfocus();
      },
      child: Scaffold(
        appBar: myAppBar(title: "New Record"),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                customTextField(
                  labelText: "Tag Number*",
                  textEditingController: tagNoController,
                  focusNode: tagNoNode,
                ),
                SizedBox(height: 16.0),
                customTextField(
                  labelText: "Yield*",
                  textEditingController: yieldController,
                  focusNode: yieldNode,
                ),
                SizedBox(height: 16.0),
                customTextField(
                  labelText: "Yield On Calf*",
                  textEditingController: yieldOnCalfController,
                  focusNode: yieldOnCalfNode,
                ),
                SizedBox(height: 16.0),
                customTextField(
                  labelText: "Observations",
                  textEditingController: observationsController,
                  focusNode: observationsNode,
                  maxLines: 3,
                  textInputType: TextInputType.multiline,
                ),
                SizedBox(height: 32.0),
                Center(
                  child: customButton(
                      context: context,
                      isLoading: _milkingController.isLoading,
                      func: _submitData),
                ),
                Container(
                  height: MediaQuery.of(context).size.width * .1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.info, size: 15, color: Colors.red),
                      Text(
                        "All fields marked with * are required",
                        style: TextStyle(fontSize: 13, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
