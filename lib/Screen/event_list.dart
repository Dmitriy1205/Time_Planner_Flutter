import 'package:flutter/material.dart';
import 'package:organizer_app/Screen/button_page.dart';
import 'package:organizer_app/todo_service.dart';

import '../todo.dart';

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
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomRight,
                    colors: [Colors.teal, Colors.tealAccent]),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 2,
                    offset: Offset(0, 0),
                  ),
                ],
                color: Colors.teal,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Container(
              child: ExpansionTile(
                title: Text(
                  'Goal',
                  style: TextStyle(color: Colors.black),
                ),
                children: <Widget>[
                  SizedBox(
                    child: ListView.builder(
                        itemCount: _todoList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(_todoList[index].title ?? 'No Title'),
                                ],
                              ),
                              subtitle: Text(
                                  _todoList[index].category ?? 'No Category'),
                              trailing:
                                  Text(_todoList[index].todoFrom ?? ' No Date'),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: ExpansionTile(
              leading: Icon(Icons.event),
              title: Text('Plan'),
              children: <Widget>[
                ListTile(
                  title: Text('number 1'),
                ),
                ListTile(
                  title: Text('number 2'),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: ExpansionTile(
              leading: Icon(Icons.event),
              title: Text('Home'),
              children: <Widget>[
                ListTile(
                  title: Text('number 1'),
                ),
                ListTile(
                  title: Text('number 2'),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: ExpansionTile(
              leading: Icon(Icons.event),
              title: Text('Spiritual'),
              children: <Widget>[
                ListTile(
                  title: Text('number 1'),
                ),
                Divider(),
                ListTile(
                  title: Text('number 2'),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.lime,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: ExpansionTile(
              leading: Icon(Icons.event),
              title: Text('Work'),
              children: <Widget>[
                ListTile(
                  title: Text('number 1'),
                ),
                ListTile(
                  title: Text('number 2'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
