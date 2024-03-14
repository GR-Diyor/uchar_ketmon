

import 'package:flutter/material.dart';

import 'core/configs/app_string.dart';
import 'core/configs/app_style.dart';
import 'feature/data/ui/home.dart';
import 'feature/data/ui/splash.dart';
import 'feature/data/ui/start.dart';

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
