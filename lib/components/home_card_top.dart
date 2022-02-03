import 'package:cached_network_image/cached_network_image.dart';
import 'package:cafexpress/constants/constants.dart';
import 'package:flutter/material.dart';

class TopCard extends StatefulWidget {
  final String image;
  const TopCard({Key? key, required this.image}) : super(key: key);

  @override
  _TopCard createState() => _TopCard();
}

class _TopCard extends State<TopCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: InkWell(
        onTap: () => {debugPrint("tapped!")},
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            SizedBox(
              width: deviceWidth * 0.85,
              height: deviceHeight * 0.3,
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
              width: deviceWidth * 0.4,
              height: deviceHeight * 0.13,
              margin: const EdgeInsets.only(top: 4, left: 4),
              child: const Text(
                "期間限定！\nエビフライ定食\n600円（税込）",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                ),
                border: Border.all(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
