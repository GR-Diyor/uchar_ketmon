import 'package:flutter/material.dart';

void showSnackBar(String message) {
  final messenger = scaffoldMessengerKey.currentState;
  messenger?.showSnackBar(
    SnackBar(content: Text(message)),
  );
}

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
GlobalKey(debugLabel: 'scaffoldMessengerKey');