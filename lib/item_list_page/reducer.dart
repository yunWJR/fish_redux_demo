import 'package:fish_redux/fish_redux.dart';

import '../api.dart';
import 'action.dart';
import 'state.dart';

Reducer<ItemsListState> buildReducer() {
  return asReducer(
    <Object, Reducer<ItemsListState>>{
      ItemsListAction.action: _onAction,
      ItemsListAction.loadData: _onLoadData,
    },
  );
}

ItemsListState _onAction(ItemsListState state, Action action) {
  final ItemsListState newState = state.clone();
  return newState;
}

//初始化数据
ItemsListState _onLoadData(ItemsListState state, Action action) {
  final ItemsListState newState = state.clone()..models = Api().getGridData(); //从Api请求数据
  return newState;
}
