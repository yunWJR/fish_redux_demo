import 'package:fish_demo/item_list_page/page.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action; //注意1

import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
    LoginAction.action: _onAction,
    LoginAction.loginSuc: _onLoginSuc,
  });
}

void _onAction(Action action, Context<LoginState> ctx) {}

void _onLoginSuc(Action action, Context<LoginState> ctx) {
  Navigator.of(ctx.context).pushNamed(ItemsListPage.routeName, arguments: null); //注意2
}
