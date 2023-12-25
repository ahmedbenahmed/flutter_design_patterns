import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/singleton/singleton.dart';

class MySingletonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the singleton instance
    MySingleton singleton = MySingleton();

    return Scaffold(
      appBar: AppBar(
        title: Text('Singleton Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Singleton Example',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              singleton.getHelloMessage(),
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
