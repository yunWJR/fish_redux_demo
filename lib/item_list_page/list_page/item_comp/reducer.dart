import 'dart:ui';

import 'package:fish_demo/global_store/store.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<ItemState>>{
      ItemAction.onChangeTheme: _onChangeTheme,
//      GlobalAction.didThemeColorChanged: _didThemeColorChanged,
    },
  );
}

ItemState _onAction(ItemState state, Action action) {
  final ItemState newState = state.clone();
  return newState;
}

ItemState _didThemeColorChanged(ItemState state, Action action) {
//  final ItemState newState = state.clone();
//  return newState;

  print("ItemState_didThemeColorChanged");

  final Color color = GlobalStore.store.getState().themeColor;

  println(color);

//  final Color color = action.payload;

  return state.clone()..themeColor = color;
}

ItemState _onChangeTheme(ItemState state, Action action) {
//  final ItemState newState = state.clone();
//  return newState;

  print("color_ItemState_onChangeTheme");

  final Color color = GlobalStore.store.getState().themeColor;
  print(color);

//  final Color color = action.payload;

  return state.clone()..themeColor = color;
}
