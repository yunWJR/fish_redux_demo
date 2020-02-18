import 'package:fish_demo/login_page/page.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'global_store/state.dart';
import 'global_store/store.dart';
import 'item_list_page/list_page/page.dart';
import 'item_list_page/page.dart';

// 创建 root widget
Widget createRootApp() {
  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      LoginPage.routeName: LoginPage(), //在这里添加页面
      ItemsListPage.routeName: ItemsListPage(), //在这里添加页面
      ListPage.routeName: ListPage(),
    },
    visitor: (String path, Page<Object, dynamic> page) {
      print("page");
      print(page);

      /// 满足条件 Page<T> ，T 是 GlobalBaseState 的子类。
      if (page.isTypeof<GlobalBaseState>()) {
        /// 建立 AppStore 驱动 PageStore 的单向数据连接
        /// 1. 参数1 AppStore
        /// 2. 参数2 当 AppStore.state 变化时, PageStore.state 该如何变化
        page.connectExtraStore<GlobalState>(GlobalStore.store,
            (Object pageState, GlobalState appState) {
          print("pageState");
          print(pageState);

          final GlobalBaseState p = pageState;
          if (p.themeColor != appState.themeColor) {
            if (pageState is Cloneable) {
              final Object copy = pageState.clone();
              final GlobalBaseState newState = copy;
              newState.themeColor = appState.themeColor;

              // todo 采用themeChange 方法实现
//              if (newState.runtimeType == ListState().runtimeType) {
//                print("ListState");
//
//                ListState ls = newState;
//                ls.themeChange();
//                return ls;
//              }

//              newState.themeChange();
              return newState;
            }
          }
          return p;
        });
      }
    },
  );

  return MaterialApp(
    title: 'Yun Fish Redux Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: Colors.green,
    ),
    home: routes.buildPage(LoginPage.routeName, null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}
