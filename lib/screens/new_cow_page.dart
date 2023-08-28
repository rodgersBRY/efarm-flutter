import 'package:flutter/material.dart';

import '../widgets/appbar.dart';

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
        appBar: myAppBar("Add Cow"),
      ),
    );
  }
}
