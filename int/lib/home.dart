import 'package:flutter/material.dart';
import 'package:int/custom.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        button(),
        Row(
          children: [],
        )
      ],
    ));
  }
}


