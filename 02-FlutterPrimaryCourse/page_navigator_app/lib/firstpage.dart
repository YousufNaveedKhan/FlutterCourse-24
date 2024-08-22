import 'package:flutter/material.dart';

void main() {
  runApp(const firstpage());
}

class firstpage extends StatefulWidget {
  const firstpage({super.key});

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("First Page")
      ),
    );
  }
}
