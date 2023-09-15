import 'package:flutter/material.dart';

class Supervisor extends StatelessWidget {
  const Supervisor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
      ),
      body: Text("Welcome supervisor"),
    );
  }
}
