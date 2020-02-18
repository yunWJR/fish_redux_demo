import 'package:fish_demo/login_page/action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(LoginState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: state.themeColor,
      title: Text('登录'),
    ),
    body: Container(
      child: Center(
        child: RaisedButton(
            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
            color: Colors.green,
            child: Text(
              "登录",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              dispatch(LoginActionCreator.onLoginSuc());
            }),
      ),
    ),
  );
}
