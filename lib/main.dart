import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organizer_app/bottom_bar.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    builder: (context, child) {
      return Directionality(textDirection: TextDirection.ltr, child: child);
    },
    title: "GNav",
    theme: ThemeData(
      primaryColor: Colors.pink[300],
    ),
    home: BottomBar()));
