import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/organizer_app/lib/data/category.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/organizer_app/lib/data/todo.dart';
import 'package:intl/intl.dart';
import 'package:organizer_app/constants.dart';

class ButtonPage extends StatefulWidget {
  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  var _selectedValue;

  // ignore: deprecated_member_use
  var _categories = List<DropdownMenuItem>();

  var _todoTitle = TextEditingController();
  var _todoDescription = TextEditingController();
  var _todoFrom = TextEditingController();
  var _todoTo = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  _loadCategories() async {
    var _categoryService = Category();
    var categories = _categoryService.expList;
    categories.forEach((category) {
      setState(() {
        _categories.add(DropdownMenuItem(
          child: Text('ohj'),
        ));
      });
    });
  }

  DateTime _dateTime = DateTime.now();

  _selectedTodoDate(BuildContext context) async {
    var _pickedData = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (_pickedData != null) {
      setState(() {
        _dateTime = _pickedData;
        _todoFrom.text = DateFormat('yyyy-MM-dd').format(_pickedData);
      });
    }
  }

  _selectedToDate(BuildContext context) async {
    var _pickedData = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (_pickedData != null) {
      setState(() {
        _dateTime = _pickedData;
        _todoTo.text = DateFormat('yyyy-MM-dd ' ' hh-mm').format(_pickedData);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.vertical(bottom: Radius.elliptical(30, 10))),
        toolbarHeight: 35.0,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                TextField(
                  controller: _todoTitle,
                  decoration: InputDecoration(
                      labelText: 'Title', hintText: 'Write Title'),
                ),
                TextField(
                  controller: _todoDescription,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    hintText: 'Write Description',
                  ),
                ),
                TextField(
                  controller: _todoFrom,
                  decoration: InputDecoration(
                    labelText: "From",
                    prefixIcon: InkWell(
                      onTap: () {
                        _selectedTodoDate(context);
                      },
                      child: Icon(Icons.date_range_outlined),
                    ),
                  ),
                ),
                TextField(
                  controller: _todoTo,
                  decoration: InputDecoration(
                    labelText: "To",
                    prefixIcon: InkWell(
                      onTap: () {
                        _selectedToDate(context);
                      },
                      child: Icon(Icons.date_range_outlined),
                    ),
                  ),
                ),
                DropdownButton(
                  hint: Text('Category'),
                  value: _selectedValue,
                  items: _categories,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    var todoObject = Todo();

                    todoObject.title = _todoTitle.text;
                    todoObject.description = _todoDescription.text;
                    todoObject.isFinished = 0;
                    todoObject.category = _selectedValue.toString();
                    todoObject.todoFrom = _todoFrom.text;
                    todoObject.todoTo = _todoTo.text;

                    //var _todoService = TodoService();
                    //var result = await _todoService.saveTodo(todoObject);
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
