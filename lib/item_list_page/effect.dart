import 'package:fish_demo/global_store/action.dart';
import 'package:fish_demo/global_store/store.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action; //注意1

import 'action.dart';
import 'list_page/action.dart';
import 'list_page/item_comp/action.dart';
import 'list_page/page.dart';
import 'state.dart';

Effect<ItemsListState> buildEffect() {
  return combineEffects(<Object, Effect<ItemsListState>>{
    Lifecycle.initState: _init, //页面初始化
    ItemsListAction.action: _onAction,
    ItemsListAction.openList: _onOpenList,
    ItemsListAction.onChangeTheme: _onChangeTheme,
  });
}

void _onAction(Action action, Context<ItemsListState> ctx) {}

void _init(Action action, Context<ItemsListState> ctx) {
  ctx.dispatch(ItemsListActionCreator.onLoadData()); //发送事件
}

void _onOpenList(Action action, Context<ItemsListState> ctx) {
  String uniqueId = action.payload;

  for (var value in ctx.state.models) {
    if (value.uniqueId == uniqueId) {
      Navigator.of(ctx.context)
          .pushNamed(ListPage.routeName, arguments: value); //注意2

      return;
    }
  }
}

void _onChangeTheme(Action action, Context<ItemsListState> ctx) {
  GlobalStore.store.dispatch(GlobalActionCreator.changeThemeColor());

  ctx.broadcast(GlobalActionCreator.didThemeColorChanged(null));
  ctx.broadcast(ItemActionCreator.onChangeTheme());
  ctx.broadcast(ListActionCreator.onChangeTheme());

  print("ItemsListState_onChangeTheme");
}
