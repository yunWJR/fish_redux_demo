import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ItemsListPage extends Page<ItemsListState, Map<String, dynamic>> {
  static final routeName = 'items_list_page';

  ItemsListPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<ItemsListState>(
              adapter: null, slots: <String, Dependent<ItemsListState>>{}),
          middleware: <Middleware<ItemsListState>>[],
        );
}
