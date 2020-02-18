import 'dart:ui';

import 'package:fish_demo/global_store/state.dart';
import 'package:fish_demo/item_list_page/list_page/report_comp/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import '../../model.dart';
import 'item_comp/state.dart';

class ListState extends MutableSource
    implements Cloneable<ListState>, GlobalBaseState {
  List<ItemState> items; //保存item的state

  GridModel grid;

  @override
  Color themeColor;

  @override
  ListState clone() {
    return ListState()
      ..items = items
      ..themeColor = themeColor
      ..grid = grid;
  }

  @override
  Object getItemData(int index) => items[index]..themeColor = themeColor;

  @override
  String getItemType(int index) => 'MyItem';

  @override
  int get itemCount => items?.length ?? 0;

  @override
  void setItemData(int index, Object data) => items[index] = data;

  void themeChange() {
    if (items != null) {
      for (int i = 0; i < items.length; i++) {
        var value = items[i];

        var newValue = value.clone();

        print(newValue.themeColor.toString());
        newValue.themeColor = themeColor;
        print(newValue.themeColor.toString());

        updateItemData(i, newValue, true);
      }
    }
  }
}

// page 才有，component 没有，component 共用 page 的 store
ListState initState(GridModel args) {
  final ListState state = ListState();

  state.grid = args?.clone() ?? GridModel();

  return state;
}

class ReportConnector extends ConnOp<ListState, ReportState>
    with ReselectMixin<ListState, ReportState> {
  @override
  ReportState computed(ListState state) {
    return ReportState()
      ..done = state.items.where((ItemState iSt) => iSt.type == 1).length
      ..total = state.items.length
      ..themeColor = state.themeColor;
  }

  // 更改
  @override
  List<dynamic> factors(ListState state) {
    return <dynamic>[
      state.items.where((ItemState iSt) => iSt.type == 1).length,
      state.items.length,
      state.themeColor
    ];
  }

  @override
  void set(ListState state, ReportState subState) {
    throw Exception('Unexcepted to set ItemsListState from ReportState');
  }
}
