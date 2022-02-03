import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddMenu extends StatelessWidget {
  const AddMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dbName = "";
    String name = "";
    String contents = "";
    String image = "";
    int price = 0;

    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(label: Text("dbname(英数字のみ)")),
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            dbName = value;
          },
        ),
        TextFormField(
          decoration: const InputDecoration(label: Text("name")),
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            name = value;
          },
        ),
        TextFormField(
          decoration: const InputDecoration(label: Text("contents")),
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            contents = value;
          },
        ),
        TextFormField(
          decoration: const InputDecoration(label: Text("url")),
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            image = value;
          },
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: const InputDecoration(label: Text("price")),
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            price = int.parse(value);
          },
        ),
        ElevatedButton(
            onPressed: () => {
                  FirebaseFirestore.instance
                      .collection("menu")
                      .doc("higawari_teishoku")
                      .update(
                    {
                      dbName: {
                        "name": name,
                        "contents": contents,
                        "image": image,
                        "price": price,
                      },
                    },
                  ),
                },
            child: const Text("import datebase"))
      ],
    );
  }
}
