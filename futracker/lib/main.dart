import 'package:FUTracker/ui/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// 
void main() {
  runApp(MyApp());
}
// 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'FUTracker',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Home(),
        );
    }
  }

