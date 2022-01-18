import 'package:cached_network_image/cached_network_image.dart';
import 'package:cafexpress/constants/constants.dart';
import 'package:flutter/material.dart';

class MenuList extends StatefulWidget {
  const MenuList({Key? key}) : super(key: key);
  @override
  _MenuListState createState() => _MenuListState();
}

List<Card> _createCards() {
  Map<String, String> menuList = {
    '日替わり定食':
        'https://kd-cafexpress.s3.ap-northeast-3.amazonaws.com/higawari.jpg',
    '丼もの': 'https://kd-cafexpress.s3.ap-northeast-3.amazonaws.com/don.jpg',
    'カレー': 'https://kd-cafexpress.s3.ap-northeast-3.amazonaws.com/kare-.jpg',
    '麺類': 'https://kd-cafexpress.s3.ap-northeast-3.amazonaws.com/udon.jpg',
    'ファストフード':
        'https://kd-cafexpress.s3.ap-northeast-3.amazonaws.com/potato.jpg',
    '小鉢': 'https://kd-cafexpress.s3.ap-northeast-3.amazonaws.com/karaage.jpg',
    'パン': 'https://kd-cafexpress.s3.ap-northeast-3.amazonaws.com/pan.jpg',
    'ドリンク': 'https://kd-cafexpress.s3.ap-northeast-3.amazonaws.com/drink.jpg',
  };
  List<Card> menuListCards = [];
  menuList.forEach(
    (key, value) {
      menuListCards.add(
        Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          child: Stack(
            children: [
              Container(
                color: null,
                child: CachedNetworkImage(
                  imageUrl: value,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.5),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  key,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
  return menuListCards;
}

List<Container> createRowCardList() {
  List<Card> cards = _createCards();
  List<Container> menuCardList = [];
  for (int i = 0; i < cards.length; i += 2) {
    menuCardList.add(
      Container(
        width: deviceWidth * 0.85,
        color: null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              //constraints: const BoxConstraints.expand(),
              margin: const EdgeInsets.all(10),
              width: deviceWidth * 0.37,
              height: deviceHeight * 0.12,
              child: cards[i],
              //color: Colors.pink,
            ),
            Container(
              //constraints: const BoxConstraints.expand(),
              margin: const EdgeInsets.all(10),
              width: deviceWidth * 0.37,
              height: deviceHeight * 0.12,
              child: cards[i + 1],
              //color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
  return menuCardList;
}

class _MenuListState extends State<MenuList> {
  List<Container> menuCardList = createRowCardList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        width: deviceWidth * 0.85,
        height: deviceHeight * 0.6,
        //親Widget(menu.dart)と同じ値にしないとクラッシュする
        child: ListView.builder(
          //physics: const NeverScrollableScrollPhysics(),
          itemCount: menuCardList.length,
          itemBuilder: (BuildContext context, int index) {
            return menuCardList[index];
          },
        ),
      ),
    );
  }
}
