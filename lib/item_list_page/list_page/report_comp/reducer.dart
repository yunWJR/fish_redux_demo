import 'dart:ui';

import 'package:fish_demo/global_store/store.dart';
import 'package:fish_redux/fish_redux.dart';

import '../action.dart';
import 'action.dart';
import 'state.dart';

Reducer<ReportState> buildReducer() {
  return asReducer(
    <Object, Reducer<ReportState>>{
      ReportAction.action: _onAction,
      ListAction.onChangeTheme: _onChangeTheme,
    },
  );
}

ReportState _onAction(ReportState state, Action action) {
  final ReportState newState = state.clone();
  return newState;
}

ReportState _onChangeTheme(ReportState state, Action action) {
//  final ItemState newState = state.clone();
//  return newState;

  print("ReportState_onChangeTheme");

  final Color color = GlobalStore.store.getState().themeColor;

//  final Color color = action.payload;

  return state.clone()..themeColor = color;
}