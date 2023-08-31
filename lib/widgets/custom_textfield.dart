import 'package:flutter/material.dart';

Container customTextField({
  required FocusNode focusNode,
  required TextEditingController controller,
  required String hintText,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: TextField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
        hintText: hintText,
      ),
    ),
  );
}
