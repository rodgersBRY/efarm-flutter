import 'package:flutter/material.dart';

import '../widgets/appbar.dart';

class BreedingPage extends StatelessWidget {
  const BreedingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: myAppBar(title: "Breeding"),
      ),
    );
  }
}
