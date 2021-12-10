import 'package:flutter/material.dart';

class QrcodePage extends StatefulWidget {
  @override
  _QrcodePageState createState() => _QrcodePageState();
}

class _QrcodePageState extends State<QrcodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("3ページ目"),
      ),
      body: const Center(
        child: Text("3ページ目です"),
      ),
    );
  }
}
