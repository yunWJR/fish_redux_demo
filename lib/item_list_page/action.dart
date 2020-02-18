import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ItemsListAction { action, loadData, openList, onChangeTheme }

class ItemsListActionCreator {
  static Action onAction() {
    return const Action(ItemsListAction.action);
  }

  static Action onLoadData() {
    return Action(ItemsListAction.loadData);
  }

  static Action onOpenList(String uniqueId) {
    return Action(ItemsListAction.openList, payload: uniqueId);
  }

  static Action onChangeTheme() {
    return const Action(ItemsListAction.onChangeTheme);
  }
}
