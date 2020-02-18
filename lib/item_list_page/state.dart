import 'dart:ui';

import 'package:fish_demo/global_store/state.dart';
import 'package:fish_redux/fish_redux.dart';

import '../model.dart';

class ItemsListState  extends GlobalBaseState implements Cloneable<ItemsListState>{
  List<GridModel> models; // 存放数据

//  @override
  Color themeColor;

  @override
  ItemsListState clone() {
    return ItemsListState()
      ..models = models
      ..themeColor = themeColor;
  }
}

ItemsListState initState(Map<String, dynamic> args) {
  return ItemsListState();
}
