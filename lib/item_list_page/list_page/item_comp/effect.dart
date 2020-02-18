import 'package:fish_demo/global_store/action.dart';
import 'package:fish_demo/global_store/store.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<ItemState> buildEffect() {
  return combineEffects(<Object, Effect<ItemState>>{
    ItemAction.action: _onAction,
//    ItemAction.onChangeTheme: _onChangeTheme,
    GlobalAction.didThemeColorChanged: _didThemeColorChanged,
  });
}

void _onAction(Action action, Context<ItemState> ctx) {
  print("ItemState__onAction");

  GlobalStore.store.dispatch(GlobalActionCreator.changeThemeColor());

//  ctx.dispatch(GlobalActionCreator.changeThemeColor());
  ctx.broadcast(GlobalActionCreator.didThemeColorChanged(null));
//  ctx.broadcast(ItemActionCreator.onChangeTheme());
}

void _didThemeColorChanged(Action action, Context<ItemState> ctx) {
//    final Color color = GlobalStore.store.getState().themeColor;

//  final Color color = action.payload??;
  print("ItemState_didThemeColorChanged");

  ctx.dispatch(ItemActionCreator.onChangeTheme());
}

void _onChangeTheme(Action action, Context<ItemState> ctx) {
//    final Color color = GlobalStore.store.getState().themeColor;

//  final Color color = action.payload??;
  print("ItemState__onChangeTheme");
}
