import 'package:flutter/material.dart';
import 'package:uchar_ketmon/configs/app_string.dart';
import 'package:uchar_ketmon/configs/app_style.dart';
import 'package:uchar_ketmon/ui/home.dart';
import 'package:uchar_ketmon/ui/start.dart';

void main() async{
  AppStyle.init();
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
      initialRoute: Start.id,
      home: const Start(),
      routes: {
        Start.id:(context)=>const Start(),
        Home.id:(context) =>const Home(),
      },
    );
  }
}
