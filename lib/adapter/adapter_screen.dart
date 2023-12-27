import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/adapter/web_service.dart';
import 'package:flutter_design_patterns/adapter/web_service_adapter.dart';

class AdapterScreen extends StatelessWidget {
  final DataProvider dataProvider = WebServiceAdapter(WebService());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Adapter'),
        ),
        body: Center(
          child: FutureBuilder(
            // Fetch data using the DataProvider
            future:
                Future<Map<String, dynamic>>.value(dataProvider.fetchData()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                // Display data using a widget
                return DataDisplayWidget(data: snapshot.data!);
              }
            },
          ),
        ),
      ),
    );
  }
}

class DataDisplayWidget extends StatelessWidget {
  final Map<String, dynamic> data;

  DataDisplayWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Name: ${data["name"]}'),
        Text('Age: ${data["age"]}'),
      ],
    );
  }
}
