import 'package:flutter/material.dart';
import 'package:uchar_ketmon/feature/data/ui/start.dart';

import '../widget/app_screen/full_screen.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  static String id="Splash";

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  splashTime(){
    Future.delayed(const Duration(milliseconds: 1300),(){
      Navigator.pushReplacementNamed(context, Start.id);
    });
  }

@override
  void initState() {
    splashTime();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return fullScreen(context,
    const Center(
      child: Text("Super ketmon",style: TextStyle(
        color: Colors.cyanAccent,
        fontSize: 30,
      ),),
    ),
    );
  }
}
