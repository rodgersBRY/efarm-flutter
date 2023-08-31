import 'package:flutter/material.dart';

Widget customDropdown(
    {required String defaultValue,
    required List<String> list,
    required Function onChanged,
    required BuildContext context}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    width: MediaQuery.of(context).size.width,
    height: 70,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blueGrey),
      borderRadius: BorderRadius.circular(10),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: defaultValue,
        items: list
            .map<DropdownMenuItem<String>>((String item) => DropdownMenuItem(
                  child: Text(item),
                  value: item,
                ))
            .toList(),
        onChanged: (val) => onChanged(val),
      ),
    ),
  );
}
