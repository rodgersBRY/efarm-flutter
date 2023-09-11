import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MilkPage extends StatefulWidget {
  const MilkPage({super.key});

  @override
  State<MilkPage> createState() => _MilkPageState();
}

class _MilkPageState extends State<MilkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cow List'),
      ),
      // body: ListView.builder(
      //   itemCount: cows.length,
      //   itemBuilder: (context, index) {
      //     return Card(
      //       elevation: 4, // Add elevation for a shadow effect
      //       margin: EdgeInsets.all(8.0),
      //       child: ListTile(
      //         title: Text(
      //           'Cow Name: ${cows[index].name}',
      //           style: TextStyle(fontWeight: FontWeight.bold),
      //         ),
      //         subtitle: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text('Yield: ${cows[index].yield.toStringAsFixed(2)} L'),
      //             Text('Tag Number: ${cows[index].tagNo}'),
      //           ],
      //         ),
      //         // You can also add more custom styling to ListTile here
      //       ),
      //     );
      //   },
      // ),
    );
  }
}