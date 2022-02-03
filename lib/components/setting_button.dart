import 'package:cafexpress/constants/constants.dart';
import 'package:flutter/material.dart';

class SettingButton extends StatefulWidget {
  final String txt;
  final Icon leftIcon;
  const SettingButton({
    Key? key,
    required this.txt,
    required this.leftIcon,
  }) : super(key: key);

  @override
  _SettingButtonState createState() => _SettingButtonState();
}

class _SettingButtonState extends State<SettingButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceWidth * 0.85,
      height: deviceHeight * 0.14,
      margin: const EdgeInsets.only(bottom: 8),
      child: ElevatedButton(
        onPressed: () => {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.leftIcon,
            Text(widget.txt, style: const TextStyle(fontSize: 20)),
            const Icon(Icons.chevron_right, size: 50)
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: appSilver,
          onPrimary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
