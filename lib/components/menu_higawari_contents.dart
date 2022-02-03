import 'package:cafexpress/firebase/get_menu.dart';
import 'package:flutter/material.dart';

class HigawariPage extends StatefulWidget {
  const HigawariPage({Key? key}) : super(key: key);
  @override
  _HigawariPageState createState() => _HigawariPageState();
}

class _HigawariPageState extends State<HigawariPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("日替わり定食"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              MenuContents(
                collectionName: "higawari_teishoku",
                documentName: "ebidesuyo",
                contents: true,
              ),
              MenuContents(
                collectionName: "higawari_teishoku",
                documentName: "ebifly",
                contents: true,
              ),
              MenuContents(
                collectionName: "higawari_teishoku",
                documentName: "ebiman",
                contents: true,
              ),
              MenuContents(
                collectionName: "higawari_teishoku",
                documentName: "sanma",
                contents: true,
              ),
              MenuContents(
                collectionName: "higawari_teishoku",
                documentName: "misokatsu",
                contents: true,
              ),
              MenuContents(
                collectionName: "higawari_teishoku",
                documentName: "ebidesuyo",
                contents: true,
              ),
              MenuContents(
                collectionName: "higawari_teishoku",
                documentName: "ebifly",
                contents: true,
              ),
              MenuContents(
                collectionName: "higawari_teishoku",
                documentName: "ebiman",
                contents: true,
              ),
              MenuContents(
                collectionName: "higawari_teishoku",
                documentName: "sanma",
                contents: true,
              ),
              MenuContents(
                collectionName: "higawari_teishoku",
                documentName: "misokatsu",
                contents: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
