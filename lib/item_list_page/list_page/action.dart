import 'package:fish_redux/fish_redux.dart';

import 'item_comp/state.dart';

//TODO replace with your own action
enum ListAction { action, loadData, onChangeTheme }

class ListActionCreator {
  static Action onAction() {
    return const Action(ListAction.action);
  }

  static Action onLoadData(List<ItemState> items) {
    return Action(ListAction.loadData, payload: items);
  }

  static Action onChangeTheme() {
    return const Action(ListAction.onChangeTheme);
  }
}
