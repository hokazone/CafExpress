import 'package:cached_network_image/cached_network_image.dart';
import 'package:cafexpress/constants/constants.dart';
import 'package:flutter/material.dart';

class MiddleCard extends StatefulWidget {
  final String image;
  const MiddleCard({required this.image});

  @override
  _MiddleCard createState() => _MiddleCard();
}

class _MiddleCard extends State<MiddleCard> {
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(0),
      child: InkWell(
        onTap: () => {debugPrint("tapped!")},
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            SizedBox(
              width: deviceWidth * 0.85,
              height: deviceHeight * 0.38,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: CachedNetworkImage(
                  imageUrl: widget.image,
                  fit: BoxFit.cover,
                ),
                elevation: 8,
              ),
            ),
            Container(
              //color: Colors.pink,
              width: deviceWidth * 0.5,
              height: deviceHeight * 0.35,
              child: const Text(
                "迷ったらコレ！\n人気ランキング",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.yellow,
                    backgroundColor: Colors.pink,
                    fontWeight: FontWeight.bold),
              ),
              alignment: Alignment.bottomCenter,
            ),
          ],
        ),
      ),
    );
  }
}
