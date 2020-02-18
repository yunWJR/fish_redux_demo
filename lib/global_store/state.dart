import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

abstract class GlobalBaseState {
  Color get themeColor;

  set themeColor(Color color);

  void themeChange() {}
}

class GlobalState extends GlobalBaseState implements Cloneable<GlobalState> {
  @override
  Color themeColor = Colors.blue;

  int index = 0;

  @override
  GlobalState clone() {
    return GlobalState();
  }

  @override
  void themeChange() {}
}
