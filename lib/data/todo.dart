class Todo {
  int id;
  String title;
  String description;
  String category;
  String todoFrom;
  String todoTo;
  int isFinished;

  todoMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['title'] = title;
    mapping['description'] = description;
    mapping['category'] = category;
    mapping['todoFrom'] = todoFrom;
    mapping['todoTo'] = todoTo;
    mapping['isFinished'] = isFinished;

    return mapping;
  }
}
