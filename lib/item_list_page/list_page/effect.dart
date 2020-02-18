import 'package:english_words/english_words.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'item_comp/state.dart';
import 'state.dart';

Effect<ListState> buildEffect() {
  return combineEffects(<Object, Effect<ListState>>{
    ListAction.action: _onAction,
    Lifecycle.initState: _onLoadData,
  });
}

void _onAction(Action action, Context<ListState> ctx) {}

void _onLoadData(Action action, Context<ListState> ctx) {
  List<ItemState> mockData = [];

  int count = WordPair.random().toString().length;
  count = ctx.state.grid.count;

  for (int i = 0; i < count; i++) {
    ItemState item = ItemState(
        type: WordPair.random().toString().length % 2,
        title: "点击切换主题-" + WordPair.random().asPascalCase,
        content: randomContent());

    mockData.add(item);
  }

  ctx.dispatch(ListActionCreator.onLoadData(mockData));
}

String randomContent() {
  String ctn = "";

  int count = WordPair.random().toString().length;

  for (int i = 0; i < count; i++) {
    ctn += WordPair.random().toString();
    ctn += "  ";
  }

  return ctn;
}
