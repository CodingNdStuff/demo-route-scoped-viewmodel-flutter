import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {
  MainViewModel() {
    debugPrint("[log] $runtimeType constructor called");
  }

  String get message => "Hello! This data is stored in the $runtimeType";
}
