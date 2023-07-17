import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uchar_ketmon/configs/app_string.dart';
import 'package:uchar_ketmon/configs/app_style.dart';
import 'package:uchar_ketmon/ui/home.dart';
import 'package:uchar_ketmon/ui/splash.dart';
import 'package:uchar_ketmon/ui/start.dart';
import 'package:uchar_ketmon/utills/prefs.dart';

Future<void> main() async{
  await AppStyle.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      theme: ThemeData.light(),
      initialRoute: Splash.id,
      home: const Splash(),
      routes: {
        Start.id:(context)=>const Start(),
        Home.id:(context) =>const Home(),
        Splash.id:(context)=>const Splash(),
      },
    );
  }
}
