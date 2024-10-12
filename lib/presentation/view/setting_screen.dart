import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(32), topLeft: Radius.circular(32)),
            color: Colors.white,
          ),
          child: const Padding(
            padding: EdgeInsets.all(32),
            child: Center(
              child: Text('SETTING SCREEN'),
            ),
          ),
        ),
      ],
    );
  }
}