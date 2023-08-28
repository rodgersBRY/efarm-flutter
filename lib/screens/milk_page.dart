import 'package:flutter/material.dart';

import '../widgets/appbar.dart';

class MilkPage extends StatelessWidget {
  const MilkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: myAppBar("Milking"),
      ),
    );
  }
}
