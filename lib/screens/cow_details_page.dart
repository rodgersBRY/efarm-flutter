import 'package:flutter/material.dart';

import '../widgets/appbar.dart';

class CowDetailsScreen extends StatelessWidget {
  final String cowName;
  const CowDetailsScreen({super.key, required this.cowName});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: myAppBar(cowName),
    ));
  }
}
