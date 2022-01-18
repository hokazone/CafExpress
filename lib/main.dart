import 'package:cafexpress/constants/constants.dart';
import 'package:cafexpress/pages/home.dart';
import 'package:cafexpress/pages/menu.dart';
import 'package:cafexpress/pages/qrcode.dart';
import 'package:cafexpress/pages/setting.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
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

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    final _pages = <Widget>[
      const HomePage(),
      const MenuPage(),
      const QrcodePage(),
      const SettingPage(),
    ];

    final _bottomNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: "ホーム"),
      const BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "メニュー"),
      const BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: "受け取り"),
      const BottomNavigationBarItem(icon: Icon(Icons.settings), label: "設定")
    ];

    assert(_pages.length == _bottomNavBarItems.length);

    return Scaffold(
      body: _pages[_currentTab],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            onTap: _onTap,
            items: _bottomNavBarItems,
            currentIndex: _currentTab,
            type: BottomNavigationBarType.shifting,
            unselectedItemColor: Theme.of(context).disabledColor,
            selectedItemColor: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
