

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uchar_ketmon/feature/data/cubit/splash_cubit.dart';

import 'core/configs/app_string.dart';
import 'core/configs/app_style.dart';
import 'feature/data/cubit/game_cubit.dart';
import 'feature/data/cubit/home_cubit.dart';
import 'feature/data/ui/game.dart';
import 'feature/data/ui/splash.dart';
import 'feature/data/ui/home.dart';

Future<void> main() async{
  await AppStyle.init();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(
          create: (BuildContext context) => SplashCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (BuildContext context) => HomeCubit(),
        ),
        BlocProvider<GameCubit>(
          create: (BuildContext context) => GameCubit(),
        ),
      ],
  child: const MyApp()));
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
        Home.id:(context)=>const Home(),
        Game.id:(context) =>const Game(),
        Splash.id:(context)=>const Splash(),
      },
    );
  }
}
