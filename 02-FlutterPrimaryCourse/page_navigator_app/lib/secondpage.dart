import 'package:flutter/material.dart';

void main() {
  runApp(const secondpage());
}

class secondpage extends StatefulWidget {
  const secondpage({super.key});

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Second Page"),
      ),
    );
  }
}
