import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';

DateTime getDateTime() {
  DateTime now = DateTime.now();
  return now;
}

// getUUID() async {
//   String uuid = "error_uuid";
//   DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
//   if (Platform.isAndroid) {
//     AndroidDeviceInfo deviceInfo = await deviceInfoPlugin.androidInfo;
//     print(deviceInfo.id);
//     uuid = deviceInfo.id!;
//     return deviceInfo.id;
//   } else if (Platform.isIOS) {
//     IosDeviceInfo deviceInfo = await deviceInfoPlugin.iosInfo;
//     print(deviceInfo.identifierForVendor);
//     uuid = deviceInfo.identifierForVendor!;
//   }
//   return uuid;
//   //var uuid = iosInfo.identifierForVendor;
//   //return uuid;
// }

String generateOrderId([int length = 10]) {
  const charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-_';
  final random = Random.secure();
  final randomStr =
      List.generate(length, (_) => charset[random.nextInt(charset.length)])
          .join();
  return randomStr;
}

Future addOrder(String orderId, List order) async {
  String uuid = "error_uuid";
  bool createDoc = true;

  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    AndroidDeviceInfo deviceInfo = await deviceInfoPlugin.androidInfo;
    uuid = deviceInfo.id!;
  } else if (Platform.isIOS) {
    IosDeviceInfo deviceInfo = await deviceInfoPlugin.iosInfo;
    uuid = deviceInfo.identifierForVendor!;
  }

  await FirebaseFirestore.instance
      .collection("orders")
      .get()
      .then((QuerySnapshot querysnapshot) {
    for (var doc in querysnapshot.docs) {
      print(doc.id);
      if (doc.id == uuid) {
        createDoc = false;
      }
    }
  });

  DocumentReference users =
      FirebaseFirestore.instance.collection("orders").doc(uuid);
  Map<String, Object?> data = {
    orderId: {
      "isfinished": false,
      "created_at": getDateTime(),
      "order": order,
    }
  };

  if (createDoc) {
    return users
        .set(data)
        .then((value) => print("Order Added"))
        .catchError((error) => print("Failed to add order: $error"));
  } else {
    return users
        .update(data)
        .then((value) => print("Order Added"))
        .catchError((error) => print("Failed to add order: $error"));
  }
}

// class AddOrder extends StatelessWidget {
//   List orders = [];
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () => {
//         addOrder(["ebidesuyo"])
//       },
//       child: const Text("adduser"),
//     );
//   }
// }
