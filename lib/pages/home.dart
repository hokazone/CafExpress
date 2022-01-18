import 'package:cached_network_image/cached_network_image.dart';
import 'package:cafexpress/components/home_card_middle.dart';
import 'package:cafexpress/components/home_card_top.dart';
import 'package:cafexpress/constants/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ホーム"),
      ),
      body: SizedBox(
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: deviceHeight * 0.68,
            child: Column(
              children: [
                SizedBox(
                  width: deviceWidth * 0.85,
                  height: deviceHeight * 0.26,
                  child: const TopCard(
                      image:
                          "https://kd-cafexpress.s3.ap-northeast-3.amazonaws.com/higawari.jpg"),
                ),
                Stack(
                  children: <Widget>[
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: deviceWidth * 0.85,
                          height: deviceHeight * 0.2,
                          child: const MiddleCard(
                            image:
                                "https://kd-cafexpress.s3.ap-northeast-3.amazonaws.com/top.jpg",
                          ),
                          margin: const EdgeInsets.only(
                              top: 30, left: 30, right: 30),
                        ),
                      ],
                    ),
                    RotationTransition(
                      turns: const AlwaysStoppedAnimation(320 / 360),
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://kd-cafexpress.s3.ap-northeast-3.amazonaws.com/019_star.png",
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: deviceWidth * 0.83,
                  height: deviceHeight * 0.12,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(15),
                    color: appSilver,
                  ),
                  margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      const Text(
                        "現在の座席状況: 満席",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "",
                        ),
                      ),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.chair_alt),
                        onPressed: () => {debugPrint("pressed!")},
                        label: const Text(
                          "予約する",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
