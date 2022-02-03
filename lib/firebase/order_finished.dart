import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';

Future doneOrder(String orderId) async {
  String uuid = "error_uuid";

  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    AndroidDeviceInfo deviceInfo = await deviceInfoPlugin.androidInfo;
    uuid = deviceInfo.id!;
  } else if (Platform.isIOS) {
    IosDeviceInfo deviceInfo = await deviceInfoPlugin.iosInfo;
    uuid = deviceInfo.identifierForVendor!;
  }

  FirebaseFirestore.instance.collection("orders").doc(uuid).set(
    {
      orderId: {
        "isfinished": true,
      }
    },
    SetOptions(merge: true),
  );
}
