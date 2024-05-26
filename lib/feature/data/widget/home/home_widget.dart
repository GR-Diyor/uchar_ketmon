import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';
import 'package:uchar_ketmon/feature/data/widget/home/setting/setting.dart';

import '../../../../core/configs/app_color.dart';
import '../../../../core/configs/app_size.dart';
import 'package:url_launcher/url_launcher.dart';

UrlLaunch(String uri) async {
  Uri url = Uri.parse(uri);
  if (!await launchUrl(url)) {
    throw Exception('Xatolik yuz berdi');
  }
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
                              "https://www.instagram.com/rf_spenser?utm_source=qr&r=nametag");
                        },
                        child: AnyLogo.media.instagram.image()),
                    GestureDetector(
                        onTap: () {
                          UrlLaunch("https://t.me/rf_spenser");
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
Future<bool> DeviceExit(BuildContext context)async{
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