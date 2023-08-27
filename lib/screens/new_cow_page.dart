import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class NewCowPage extends StatefulWidget {
  const NewCowPage({super.key});

  @override
  State<NewCowPage> createState() => _NewCowPageState();
}

class _NewCowPageState extends State<NewCowPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cow Details'),
          backgroundColor: AppColors.primaryGreenColor,
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {
                
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.cancel_sharp,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.check,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
