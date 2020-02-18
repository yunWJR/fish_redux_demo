import 'package:english_words/english_words.dart';

import 'model.dart';

class Api {
  factory Api() {
    return _get();
  }

  static Api _instance;

  Api._internal() {
    //init Api instance
  }

  static _get() {
    if (_instance == null) {
      _instance = Api._internal();
    }
    return _instance;
  }

  List<GridModel> getGridData() {
    List<GridModel> mockData = [];

    int count = WordPair.random().toString().length * 3;

    for (int i = 0; i < count; i++) {
      int iC = WordPair.random().toString().length * 2;

      GridModel item = GridModel(
        name: WordPair.random().toString() + " 共" + iC.toString() + "项",
        count: iC,
      );

      mockData.add(item);
    }

    return mockData;
  }
}
