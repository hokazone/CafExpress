import 'package:cafexpress/pages/home.dart';
import 'package:cafexpress/pages/menu.dart';
import 'package:cafexpress/pages/qrcode.dart';
import 'package:cafexpress/pages/setting.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentTab = 0;

  void _onTap(int value) {
    setState(() {
      _currentTab = value;
    });
  }

  final _pages = <Widget>[HomePage(), MenuPage(), QrcodePage(), SettingPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentTab],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "ホーム"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "メニュー"),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: "受け取り"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "設定")
        ],
        currentIndex: _currentTab,
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Theme.of(context).disabledColor,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
