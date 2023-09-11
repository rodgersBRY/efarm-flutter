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

  void _submitData() {
    // Implement your data submission logic here
    // You can access the entered data using the controller values

    // Simulate a network request or data processing
    Future.delayed(Duration(seconds: 2), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Milking Page"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                customTextField(
                  labelText: "Tag Number",
                  textEditingController: tagNoController,
                  focusNode: tagNoNode,
                ),
                SizedBox(height: 16.0),
                customTextField(
                  labelText: "Yield",
                  textEditingController: yieldController,
                  focusNode: yieldNode,
                ),
                SizedBox(height: 16.0),
                customTextField(
                  labelText: "Yield On Calf",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}