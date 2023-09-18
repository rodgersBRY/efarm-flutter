import 'package:flutter/material.dart';

import '../widgets/appbar.dart';
import '../widgets/icons_grid.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: myAppBar(title: "Smart Dairy", centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Expanded(child: IconsGrid()),
          ],
        ),
      ),
    );
  }
}
