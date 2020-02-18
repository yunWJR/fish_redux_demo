import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ReportComponent extends Component<ReportState> {
  ReportComponent()
      : super(
          view: buildView,
          effect: buildEffect(),
          reducer: buildReducer(),
          dependencies: Dependencies<ReportState>(
              adapter: null, slots: <String, Dependent<ReportState>>{}),
        );
}
