import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum GlobalAction { changeThemeColor, didThemeColorChanged }

class GlobalActionCreator {
  static Action changeThemeColor() {
    return const Action(GlobalAction.changeThemeColor);
  }

  static Action didThemeColorChanged(Color color) {
    print("GlobalAction-didThemeColorChanged");
    return Action(GlobalAction.didThemeColorChanged, payload: color);
  }
}
