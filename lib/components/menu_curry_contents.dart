import 'package:cafexpress/firebase/get_menu.dart';
import 'package:flutter/material.dart';

class CurryPage extends StatefulWidget {
  const CurryPage({Key? key}) : super(key: key);
  @override
  _CurryPageState createState() => _CurryPageState();
}

List<Widget> currys_list() {
  List<Widget> currys = [];
  for (int i = 0; i < 10; i++) {
    currys.add(
      const MenuContents(
        collectionName: "curry",
        documentName: "gekikara",
        contents: true,
      ),
    );
  }
  return currys;
}

class _CurryPageState extends State<CurryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("カレー"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: currys_list(),
          ),
        ),
      ),
    );
  }
}
