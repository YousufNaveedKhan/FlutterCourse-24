import 'package:flutter/material.dart';

void main() {
  runApp(const thirdpage());
}

class thirdpage extends StatefulWidget {
  const thirdpage({super.key});

  @override
  State<thirdpage> createState() => _thirdpageState();
}

class _thirdpageState extends State<thirdpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Third Page"),
      ),
    );
  }
}
