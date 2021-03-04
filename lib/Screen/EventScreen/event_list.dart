import 'package:flutter/material.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/organizer_app/lib/Screen/EventScreen/button_page.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/organizer_app/lib/data/todo_service.dart';
import '../../data/todo.dart';

class EventList extends StatefulWidget {
  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  TodoService _todoService;

  List<Todo> _todoList = <Todo>[];

  @override
  void initState() {
    super.initState();
    getAllTodos();
  }

  getAllTodos() async {
    _todoService = TodoService();
    _todoList = <Todo>[];

    var todos = _todoService.readTodos();
    todos.forEach((todo) {
      setState(() {
        var model = Todo();
        model.id = todo['id'];
        model.title = todo['title'];
        model.description = todo['description'];
        model.category = todo['category'];
        model.todoFrom = todo['todoFrom'];
        model.todoTo = todo['todoTo'];
        model.isFinished = todo['isFinished'];

        _todoList.add(model);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ButtonPage()),
          );
        },
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ItemList(
            color: Colors.yellowAccent,
            text: Text('Work', textAlign: TextAlign.center),
          ),
          ItemList(
            color: Colors.pinkAccent,
            text: Text('Home', textAlign: TextAlign.center),
          ),
          ItemList(
            color: Colors.blueGrey,
            text: Text(
              'Health',
              textAlign: TextAlign.center,
            ),
          ),
          ItemList(
            color: Colors.greenAccent,
            text: Text('Spiritual', textAlign: TextAlign.center),
          ),
          ItemList(
            color: Colors.blueAccent,
            text: Text('Education', textAlign: TextAlign.center),
          ),
          ItemList(
            color: Colors.orangeAccent,
            text: Text(
              'Other',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  ItemList({
    this.color,
    this.text,
  });

  final Color color;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(20))),
      child: ExpansionTile(
        title: text,
        children: <Widget>[
          ListTile(
            title: Text('number 1'),
          ),
          ListTile(
            title: Text('number 2'),
          )
        ],
      ),
    );
  }
}
