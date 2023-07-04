import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uchar_ketmon/configs/app_color.dart';
import 'package:uchar_ketmon/view/widget/app_screen/full_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const String id = "Home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static double yAxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = yAxis;
  bool gamehasStarted = false;

  jump() {
    setState(() {
      time = 0;
      initialHeight = yAxis;
    });
  }

  start() {
    gamehasStarted = true;
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        yAxis -= initialHeight - height;
      });
      if (yAxis > 1) {
        timer.cancel();
        gamehasStarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return fullScreen(
        context,
        Column(
          children: [
            Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () {
                    if (gamehasStarted) {
                      jump();
                    } else {
                      start();
                    }
                  },
                  child: AnimatedContainer(
                    color: AppColor.blue,
                    alignment: Alignment(0, yAxis),
                    duration: const Duration(milliseconds: 0),
                    child: const FlutterLogo(
                      size: 40,
                    ),
                  ),
                )),
            Container(
              color: AppColor.green,
              height: 15,
            ),
            Expanded(
                child: Container(
              color: AppColor.brown,
            ))
          ],
        ));
  }
}
