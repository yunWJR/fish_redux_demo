import 'dart:ui';

import 'package:fish_demo/global_store/state.dart';
import 'package:fish_redux/fish_redux.dart';

class LoginState extends GlobalBaseState implements Cloneable<LoginState> {
  @override
  Color themeColor;

  @override
  LoginState clone() {
    return LoginState()..themeColor = themeColor;
  }
}

LoginState initState(Map<String, dynamic> args) {
  return LoginState();
}
