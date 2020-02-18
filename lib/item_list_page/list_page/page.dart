import 'package:fish_redux/fish_redux.dart' hide ListAdapter; //注意1

import '../../model.dart';
import 'adapter.dart';
import 'effect.dart';
import 'reducer.dart';
import 'report_comp/component.dart';
import 'state.dart';
import 'view.dart';

class ListPage extends Page<ListState, GridModel> {
  static final routeName = 'list_page';

  ListPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<ListState>(
              adapter: NoneConn<ListState>() + ListAdapter(), //注意2,
              slots: <String, Dependent<ListState>>{
                'report': ReportConnector() + ReportComponent()
              }),
          middleware: <Middleware<ListState>>[],
        );
}
