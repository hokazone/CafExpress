import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 200,
        width: 140,
        child: Align(
          child: Text(
            "ホーム",
            style: TextStyle(color: Colors.black, fontSize: 35),
          ),
        ),
      ),
    ));
  }
}
