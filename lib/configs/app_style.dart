import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_color.dart';


class AppStyle{

  static Future<void>init()async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

  }
  static Future<void>fullScreen()async{
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
  }
  static Future<void>manualScreen()async{
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
  }

  //AppBar

  static SystemUiOverlayStyle defaultUIOverlay = SystemUiOverlayStyle.light;


  //style of bottombar and statusbar
  static SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: AppColor.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemStatusBarContrastEnforced: false,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: AppColor.transparent,
    systemNavigationBarDividerColor: AppColor.transparent,
    systemNavigationBarContrastEnforced: false,
  );

}