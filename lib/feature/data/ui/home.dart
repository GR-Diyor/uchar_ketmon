import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:uchar_ketmon/feature/data/cubit/home_cubit.dart';
import 'package:uchar_ketmon/feature/data/cubit/home_state.dart';
import '../../../core/configs/app_color.dart';
import '../../../core/configs/app_size.dart';
import '../widget/app_screen/full_screen.dart';
import '../widget/home/home_widget.dart';
import 'game.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const String id = "Start";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color button = Colors.green;
  int counter = 1;
  late Timer timer;

  changeColor() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      // print(timer.tick);
      setState(() {
        if (timer.tick % 2 == 0) {
          button = Colors.blueAccent;
        } else {
          button = Colors.green;
        }
      });
    });
  }



  @override
  void initState() {
    changeColor();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>HomeCubit(),
      child: BlocBuilder<HomeCubit,HomeState>(
        builder: (BuildContext context, HomeState state) {
          return WillPopScope(
            onWillPop: ()async{
              return  DeviceExit(context);
            },
            child: fullScreen(
                context,
                Stack(
                  children: [
                    Lottie.asset("assets/lotties/home.json",
                        animate: true,
                        reverse: false,
                        repeat: true,
                        options: LottieOptions(enableMergePaths: true),
                        fit: BoxFit.fill,
                        filterQuality: FilterQuality.high,
                        height: AppSize.height(context),
                        width: AppSize.width(context)),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Start button
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) => const Game()));
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 1000),
                              height: 50,
                              width: 140,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: button,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text("Boshlash",
                                  style: TextStyle(
                                      color: AppColor.primary,
                                      fontSize:
                                          AppSize.theme(context).bodyMedium!.fontSize)),
                            ),
                          ),
                          //gap
                          const SizedBox(
                            height: 15,
                          ),

                          //options button

                          GestureDetector(
                            onTap: () => setting(context),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 1000),
                              height: 50,
                              width: 140,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: button,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text("Sozlamalar",
                                  style: TextStyle(
                                      color: AppColor.primary,
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .fontSize)),
                            ),
                          ),

                          //gap
                          const SizedBox(
                            height: 15,
                          ),

                          //about

                          GestureDetector(
                            onTap: () => about(context),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 1000),
                              height: 50,
                              width: 140,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: button,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Dastur haqida",
                                style: TextStyle(
                                    color: AppColor.primary,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .fontSize),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          );
        }
      ),
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String? Level="Oson";
  bool voiceActive = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15.0,
          sigmaY: 15.0,
        ),
        child: Container(
          width: AppSize.width(context),
          height: AppSize.height(context) * 0.6,
          decoration: BoxDecoration(
            color: Theme.of(context).focusColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Sozlamalar",
                style: TextStyle(
                    color: AppColor.primary,
                    fontSize: AppSize.theme(context).bodyLarge!.fontSize),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 60,
                width: AppSize.Maxwidth,
                child: Container(
                  margin: AppSize.paddingScreen,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: AppColor.dark.withOpacity(0.05),
                  ),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Boshqich",
                          style: TextStyle(
                              color: AppColor.primary,
                              fontSize:
                                  AppSize.theme(context).bodyLarge!.fontSize),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        DropdownButton(
                          value: Level,
                          hint: Text(
                            Level ?? "",
                            style: TextStyle(
                                color: AppColor.primary,
                                fontSize: AppSize.theme(context)
                                    .bodyMedium!
                                    .fontSize),
                          ),
                          items: LeveldropDownMenuItems,
                          onChanged: (value) {
                            setState(() {
                              Level = value;
                            });
                          },
                          borderRadius: BorderRadius.circular(10),
                          elevation: 0,
                          dropdownColor: AppColor.dark.withOpacity(0.1),
                          focusColor: AppColor.transparent,
                          style: TextStyle(
                              color: AppColor.primary,
                              fontSize:
                                  AppSize.theme(context).bodyMedium!.fontSize),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 60,
                width: AppSize.Maxwidth,
                child: Container(
                  margin: AppSize.paddingScreen,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: AppColor.dark.withOpacity(0.05),
                  ),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ovoz",
                          style: TextStyle(
                              color: AppColor.primary,
                              fontSize:
                                  AppSize.theme(context).bodyLarge!.fontSize),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        CupertinoSwitch(
                            value: voiceActive,
                            onChanged: (bool value) {
                              setState(() {
                                voiceActive = value;
                                HapticFeedback.lightImpact();
                              });
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const LevelItems = <String>[
  "Oson",
  "O'rta",
  "Qiyin",
];
final List<DropdownMenuItem<String>> LeveldropDownMenuItems = LevelItems.map(
  (String value) => DropdownMenuItem<String>(
    value: value,
    child: Text(value),
  ),
).toList();
