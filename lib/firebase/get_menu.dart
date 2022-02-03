import 'package:cached_network_image/cached_network_image.dart';
import 'package:cafexpress/components/vh_listtile.dart';
import 'package:cafexpress/constants/constants.dart';
import 'package:cafexpress/firebase/add_order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MenuContents extends StatefulWidget {
  final String collectionName;
  final String documentName;
  final bool contents;
  const MenuContents(
      {Key? key,
      required this.collectionName,
      required this.documentName,
      required this.contents})
      : super(key: key);

  @override
  _MenuContentsState createState() => _MenuContentsState();
}

getImage(imageUrl) {
  try {
    return CachedNetworkImage(imageUrl: imageUrl);
  } catch (e) {
    return Image.network(
      imageUrl,
    );
  }
}

class _MenuContentsState extends State<MenuContents> {
  get builder => null;

  // ドキュメント情報を入れる箱を用意

  @override
  Widget build(BuildContext context) {
    CollectionReference collection =
        FirebaseFirestore.instance.collection(widget.collectionName);
    return FutureBuilder<DocumentSnapshot>(
      future: collection.doc(widget.documentName).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Card(
            child: VariableHeightListTile(
              title: Text(
                data["name"],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
              subtitle: widget.contents
                  ? Text(
                      "¥ ${data["price"].toString()}",
                      style: const TextStyle(fontSize: 20),
                    )
                  : Text(
                      "¥ ${data["price"].toString()}",
                      style: const TextStyle(fontSize: 30),
                    ),
              endtitle: widget.contents
                  ? Text(
                      data["contents"].toString(),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    )
                  : null,
              leading: SizedBox(
                height: deviceHeight * 0.1,
                child: getImage(data["image"]),
              ),
              onTap: () => showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: const Text(
                        "注文を確定しますか？",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: SizedBox(
                        height: deviceHeight * 0.3,
                        child: Column(
                          children: [
                            SizedBox(
                                height: deviceHeight * 0.2,
                                child: getImage(data["image"])),
                            Container(
                              width: deviceWidth * 0.85,
                              alignment: Alignment.centerLeft,
                              color: null,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(height: deviceHeight * 0.02),
                                  Text(
                                      "メニュー: ${data["name"]}\n価格: ¥ ${data["price"]}"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () => {Navigator.pop(context)},
                          child: const Text("キャンセル"),
                          style: ElevatedButton.styleFrom(primary: Colors.grey),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            String orderId = generateOrderId();
                            addOrder(orderId, [widget.documentName]);
                            Navigator.pop(context);
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return OrderResultsPage(
                            //         orderId: orderId,
                            //       );
                            //     },
                            //   ),
                            // );
                            Navigator.pushReplacementNamed(context, "/recieve");
                          },
                          child: const Text("確定"),
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                        ),
                      ],
                    );
                  }),
            ),
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
