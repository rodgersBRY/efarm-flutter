import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/appbar.dart';
import '../widgets/icons_grid.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  late String username;

  @override
  void initState() {
    super.initState();
    username = _initializeUsername();
  }

  _initializeUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? username = prefs.getString("username");
    return username;
  }

  @override
  Widget build(BuildContext context) {
    print(username);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: myAppBar(title: "Smart Dairy", centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text("Welcome $username"),
            Expanded(child: IconsGrid()),
          ],
        ),
      ),
    );
  }
}
