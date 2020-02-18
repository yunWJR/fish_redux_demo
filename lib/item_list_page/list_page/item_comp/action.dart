import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ItemAction { action, onChangeTheme }

class ItemActionCreator {
  static Action onAction() {
    return const Action(ItemAction.action);
  }

  static Action onChangeTheme() {
    return const Action(ItemAction.onChangeTheme);
  }
}
