import 'package:cafexpress/components/setting_button.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("設定"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const [
          SettingButton(
            leftIcon: Icon(
              Icons.person_outline,
              size: 50,
            ),
            txt: 'アカウント情報',
          ),
          SettingButton(
            leftIcon: Icon(
              Icons.credit_card,
              size: 50,
            ),
            txt: 'お支払い設定　',
          ),
          SettingButton(
            leftIcon: Icon(
              Icons.notifications_none,
              size: 50,
            ),
            txt: '通知設定　　　',
          ),
          SettingButton(
            leftIcon: Icon(
              Icons.help_outline,
              size: 50,
            ),
            txt: 'ヘルプセンター',
          ),
        ],
      )),
    );
  }
}
