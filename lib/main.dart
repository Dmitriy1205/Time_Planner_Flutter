import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'package:organizer_app/Screen/event_list.dart';

import 'Screen/Calendar/schedule_screen.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    builder: (context, child) {
      return Directionality(textDirection: TextDirection.ltr, child: child);
    },
    title: "GNav",
    theme: ThemeData(
      primaryColor: Colors.pink[300],
    ),
    home: Example()));

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  int _selectedIndex = 0;

  //static const TextStyle optionStyle =  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Container(
      child: Schedule(),
    ),
    Container(
      child: EventList(),
    ),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(15, 10),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          ),
        ],
        title: const Text('Future Organizer'),
        centerTitle: true,
        backgroundColor: Colors.pink[400],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 15, color: Colors.blueAccent.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 5,
                activeColor: Colors.white,
                iconSize: 28,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 700),
                tabBackgroundColor: Colors.pink[800],
                tabs: [
                  GButton(
                    icon: LineIcons.calendar_check_o,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Schedule()));
                    },
                    text: 'Planner',
                  ),
                  GButton(
                    icon: Icons.addchart,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => EventList()));
                    },
                    text: 'Add Task',
                  ),
                  GButton(
                    icon: Icons.assessment_outlined,
                    text: 'Diagram',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
