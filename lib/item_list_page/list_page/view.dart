import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(ListState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter(); //创建adapter

  return Scaffold(
      appBar: new AppBar(
        backgroundColor: state.themeColor,
        title: new Text('列表页'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            viewService.buildComponent('report'),
            Expanded(
                child: ListView.builder(
                    itemBuilder: adapter.itemBuilder,
                    itemCount: adapter.itemCount))
          ],
        ),
      ));
}
