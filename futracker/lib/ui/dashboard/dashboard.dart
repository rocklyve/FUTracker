import 'package:flutter/material.dart';
import 'package:FUTracker/utilities/constants.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("Dashboard"),
            automaticallyImplyLeading: false,
            expandedHeight: 200,
            actions: <Widget>[Icon(Icons.notifications)],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(150),
              child: Container(),
            ),
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(50))),
          )
        ],
      ),
    );
  }
}
