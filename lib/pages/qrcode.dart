import 'package:flutter/material.dart';

class QrcodePage extends StatefulWidget {
  const QrcodePage({Key? key}) : super(key: key);
  @override
  _QrcodePageState createState() => _QrcodePageState();
}

class _QrcodePageState extends State<QrcodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("受け取り"),
      ),
    );
  }
}
