import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ReportAction { action, onChangeTheme }

class ReportActionCreator {
  static Action onAction() {
    return const Action(ReportAction.action);
  }

  static Action onChangeTheme() {
    return const Action(ReportAction.onChangeTheme);
  }
}
