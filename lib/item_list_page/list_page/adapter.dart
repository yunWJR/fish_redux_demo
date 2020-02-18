import 'package:fish_demo/item_list_page/list_page/item_comp/component.dart';
import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';
import 'state.dart';

class ListAdapter extends SourceFlowAdapter<ListState> {
  ListAdapter()
      : super(
          pool: <String, Component<Object>>{
            "MyItem": ItemComponent(), //引用组件
          },
          reducer: buildReducer(),
        );
}
