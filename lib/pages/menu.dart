import 'package:cafexpress/components/menu_list.dart';
import 'package:cafexpress/components/menu_search_bar.dart';
import 'package:cafexpress/constants/constants.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "メニュー",
        ),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: deviceWidth * 0.85,
                height: deviceHeight * 0.07,
                child: const SearchBar(),
              ),
              Container(
                margin: const EdgeInsets.all(30),
                //width: deviceWidth * 0.85,
                height: deviceHeight * 0.8,
                child: const MenuList(),
                //color: Colors.pink,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
