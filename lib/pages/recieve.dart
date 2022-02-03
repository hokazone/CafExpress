import 'package:cafexpress/constants/constants.dart';
import 'package:cafexpress/firebase/order_finished.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecievePage extends StatefulWidget {
  const RecievePage({Key? key}) : super(key: key);
  @override
  _RecievePageState createState() => _RecievePageState();
}

Widget emptyItem() {
  return Container(
    alignment: Alignment.center,
    child: const Text("現在受け取り待ちの商品はありません..."),
  );
}

class _RecievePageState extends State<RecievePage> {
  bool isShowOrders = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("受け取り"),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("orders")
            .doc("E8D938DC-EE1F-46F7-86CC-87206FF6B1A5")
            //system preferenceに保存する予定
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            try {
              List<Widget> cardList = [];
              Map data = (snapshot.data?.data() as Map);
              data.forEach(
                (key, value) {
                  if (!value["isfinished"]) {
                    Timestamp timestamp = value["created_at"];
                    DateTime datetime = timestamp.toDate();
                    var fmt = DateFormat("yyyy/MM/dd hh:mm");
                    var datetimeConverted = fmt.format(datetime);
                    cardList.add(
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Center(
                          child: Card(
                            color: appSilver,
                            child: SizedBox(
                              width: deviceWidth * 0.85,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: "受け取りコード: ",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                            ),
                                            TextSpan(
                                              text: key,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.deepOrange,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "商品ID: ${value["order"][0]}",
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "注文日: $datetimeConverted",
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    SizedBox(
                                      height: deviceHeight * 0.02,
                                    ),
                                    SizedBox(
                                      width: deviceWidth * 0.83,
                                      child: ElevatedButton(
                                        onPressed: () => doneOrder(key),
                                        child: const Text("商品を受け取りました"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
              );
              if (cardList.isNotEmpty) {
                return SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(children: cardList));
              } else {
                return emptyItem();
              }
            } catch (e) {
              print(e);
              return emptyItem();
            }
          } else {
            return emptyItem();
          }
        },
      ),
    );
  }
}
