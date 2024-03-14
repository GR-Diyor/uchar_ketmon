import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_any_logo/flutter_logo.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/configs/app_color.dart';
import '../../../core/configs/app_size.dart';
import '../widget/app_screen/full_screen.dart';
import 'home.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);
  static const String id = "Start";

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
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

  UrlLaunch(String uri) async {
    Uri url = Uri.parse(uri);
    if (!await launchUrl(url)) {
      throw Exception('Xatolik yuz berdi');
    }
  }

  @override
  void initState() {
    changeColor();
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   changeColor();
  //   super.didChangeDependencies();
  // }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  about(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      isDismissible: true,
      isScrollControlled: false,
      backgroundColor: AppColor.transparent,
      barrierColor: AppColor.dark.withOpacity(0.2),
      builder: (BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 15.0,
            sigmaY: 15.0,
          ),
          child: Container(
            height: (MediaQuery.of(context).size.height - 50),
            padding: AppSize.paddingScreen,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              color: AppColor.transparent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                Text(
                  "Dastur haqida",
                  style: TextStyle(
                      color: AppColor.primary,
                      fontSize: AppSize.theme(context).bodyLarge!.fontSize),
                ),
                const SizedBox(height: 20),
                //text
                Text(
                    "Ilova Beta versiyada ishlamoqda,o'yin davomida xatolik yuzaga kelishi mumkin."
                    "Ilova haqidagi fikrlaringizni, bizning ijtimoiy tarmoqlar orqali yo'llashingiz mumkin.",
                    style: TextStyle(
                        color: AppColor.primary,
                        fontSize:
                            Theme.of(context).textTheme.bodyLarge!.fontSize)),

                const SizedBox(
                  height: 20,
                ),
                // via
                SizedBox(
                  height: 60,
                  width: AppSize.width(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: () {
                            UrlLaunch(
                                "https://www.instagram.com/spenser_dev?utm_source=qr&r=nametag");
                          },
                          child: AnyLogo.media.instagram.image()),
                      GestureDetector(
                          onTap: () {
                            UrlLaunch("https://t.me/+998905831382");
                          },
                          child: AnyLogo.media.telegram.image()),
                      GestureDetector(
                          onTap: () {
                            UrlLaunch(
                                "https://www.linkedin.com/in/diyorbek-nizomiddinov-058415232/");
                          },
                          child: AnyLogo.media.linkedin.image()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  setting(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      isDismissible: true,
      isScrollControlled: false,
      backgroundColor: AppColor.transparent,
      barrierColor: AppColor.dark.withOpacity(0.2),
      builder: (BuildContext context) => const Settings(),
    );
  }
  Future<bool> DeviceExit()async{
      showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 15.0,sigmaX: 15.0),
                child: AlertDialog(
                  backgroundColor: AppColor.primary.withOpacity(0.1),
                  alignment: Alignment.center,
                  actionsAlignment: MainAxisAlignment.spaceAround,
                  title: Text(
                    "O'yinni yakunlamoqchimisiz?!",
                    style: TextStyle(color: AppColor.primary,fontSize: AppSize.theme(context).titleMedium!.fontSize),
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    GestureDetector(
                        onTap: () {
                          exit(0);
                        },
                        child: Text(
                          "Ha",
                          style: TextStyle(color: AppColor.primary,fontSize: AppSize.theme(context).bodyMedium!.fontSize),
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Yo'q",
                          style: TextStyle(color: AppColor.primary,fontSize: AppSize.theme(context).bodyMedium!.fontSize),
                        )),
                  ],
                ),
              ),
            );
          });
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        return  DeviceExit();
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
                                builder: (BuildContext context) => const Home()));
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
