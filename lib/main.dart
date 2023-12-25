import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/factory_method_pattern/factory_method_pattern.dart';
import 'package:flutter_design_patterns/singleton/singleton.dart';
import 'package:flutter_design_patterns/singleton/singleton_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatelessWidget {
  final Random random = Random();
  final Map<String, Widget> items = {
    'Singleton': MySingletonScreen(),
    "Factory Method Pattern": FactoryMethodPatternScreen()
  };

  Color getRandomColor() {
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Flutter design Patterns',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Author: AHMED BEN AHMED',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      List<String> keys = items.keys.toList();
                      String key = keys[index];
                      print('Tapped on $key');

                      var objectValue = items[key];

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => objectValue!,
                        ),
                      );
                      // You can navigate to another screen or perform any action here
                    },
                    child: Card(
                      color: getRandomColor(),
                      child: ListTile(
                        title: Text(
                          getTitle(index),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(String cardTitle, String cardSubtitle, Color color) {
    return Card(
      color: color,
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          cardTitle,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // subtitle: Text(
        //   cardSubtitle,
        //   style: TextStyle(
        //     color: Colors.white,
        //   ),
        // ),
      ),
    );
  }

  String getTitle(int index) {
    List<String> keys = items.keys.toList();
    return keys[index];
  }
}
