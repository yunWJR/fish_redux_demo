import 'dart:ui';

import 'package:fish_demo/global_store/state.dart';
import 'package:fish_redux/fish_redux.dart';

class ItemState implements Cloneable<ItemState> {
  int type;
  String title;
  String content;

  ItemState({this.type, this.title, this.content, this.themeColor});

  Color themeColor;

  @override
  ItemState clone() {
    return ItemState()
      ..type = type
      ..title = title
      ..content = content
      ..themeColor = themeColor;
  }
}

ItemState initState(Map<String, dynamic> args) {
  return ItemState();
}
