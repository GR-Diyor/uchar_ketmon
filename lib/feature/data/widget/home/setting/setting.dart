import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/configs/app_color.dart';
import '../../../../../core/configs/app_size.dart';

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
                    borderRadius: BorderRadius.circular(25),
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
                          dropdownColor: AppColor.dark.withOpacity(0.3),
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
                    borderRadius: BorderRadius.circular(25),
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
                            trackColor: AppColor.dark.withOpacity(0.2),
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