import 'package:cafexpress/constants/constants.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: deviceWidth * 0.85,
        height: deviceHeight * 0.07,
        //color: Colors.pink,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: appSilver,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(width: 10),
            const Icon(
              Icons.search,
              size: 30,
            ),
            const SizedBox(width: 20),
            Container(
              width: deviceWidth * 0.5,
              height: deviceHeight * 0.1,
              alignment: Alignment.center,
              child: const TextField(
                style: TextStyle(
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  hintText: "料理名、タグで検索",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
