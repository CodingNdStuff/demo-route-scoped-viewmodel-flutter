import 'package:flutter/material.dart';

class SetupViewModel extends ChangeNotifier {
  int _counter = 0;
  SetupViewModel() {
    debugPrint("[log] $runtimeType constructor called");
  }

  String get message => "$runtimeType wishes to say hello!";

  int get counter => _counter++;
}
