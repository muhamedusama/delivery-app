import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Manager extends StatelessWidget {
  const Manager({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Text("Welcome manager"),
    );;
  }
}
