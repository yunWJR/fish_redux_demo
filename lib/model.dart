class GridModel {
  String uniqueId;

  String name;

  int count;

  GridModel({this.uniqueId, this.name, this.count}) {
    uniqueId ??= DateTime.now().toIso8601String();
  }

  @override
  GridModel clone() {
    return GridModel()
      ..uniqueId = uniqueId
      ..name = name
      ..count = count;
  }
}
