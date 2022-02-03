import 'package:cafexpress/constants/constants.dart';
import 'package:cafexpress/firebase/get_menu.dart';
import 'package:flutter/material.dart';

class OrderResultsPage extends StatefulWidget {
  final String orderId;
  const OrderResultsPage({Key? key, required this.orderId}) : super(key: key);
  @override
  _OrderResultsPageState createState() => _OrderResultsPageState();
}

class _OrderResultsPageState extends State<OrderResultsPage> {
  bool isShowOrders = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("受け取り"),
      ),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              //color: Colors.red,
              width: deviceWidth * 0.85,
              height: deviceHeight * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("注文番号: "),
                  Text(
                    widget.orderId,
                    style: const TextStyle(
                      fontSize: 50,
                      color: Colors.deepOrange,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: deviceWidth * 0.85,
            child: ElevatedButton(
              onPressed: () => {isShowOrders == false},
              child: const Text("商品を受け取りました!"),
            ),
          ),
          SizedBox(height: deviceHeight * 0.1),
          const Text("ご注文の商品: "),
          const MenuContents(
            collectionName: "higawari_teishoku",
            documentName: "ebidesuyo",
            contents: false,
          ),
        ],
      ),
    );
  }
}
