import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';

class ReportState implements Cloneable<ReportState> {
  int total;
  int done;

  Color themeColor;

  ReportState({this.total = 0, this.done = 0, this.themeColor});

  @override
  ReportState clone() {
    return ReportState()
      ..total = total
      ..done = done
      ..themeColor = themeColor;
  }

  @override
  String toString() {
    return 'ReportState{total: $total, done: $done}';
  }
}
