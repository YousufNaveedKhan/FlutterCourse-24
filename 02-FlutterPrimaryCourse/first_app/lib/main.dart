import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text('Introduction'),
              Text('Name: Muhammad Yousuf'),
              Text('Age: 21'),
              Text('Contact: 03312345678'),
              Text('Address: Street 404, Not found on earth'),
            ],
          ),
        ),
      ),
    );
  }
}
