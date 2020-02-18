import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

Reducer<GlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalState>>{
      GlobalAction.changeThemeColor: _onchangeThemeColor,
    },
  );
}

GlobalState _onchangeThemeColor(GlobalState state, Action action) {
  int index = state.index;
  if (index >= (Colors.primaries.length - 1)) {
    index = 0;
  } else {
    index++;
  }

  final Color color = Colors.primaries[index];

  GlobalState newState = state.clone()
    ..themeColor = color
    ..index = index;

  return newState;
}
