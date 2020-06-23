import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futracker/pages/dashboard.dart';
import 'package:futracker/pages/profile.dart';
import 'package:futracker/pages/settings.dart';
import 'package:futracker/pages/team.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Properties 
  int currentTab = 0;
  final List<Widget> screens = [
    Dashboard(),
    Team(),
    Profile(),
    Settings(),
  ];

  // Active Page ( Tab )
  Widget currentScreen = Dashboard();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      // FAB Button
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.orangeAccent,
        onPressed: (){},
      ),

      // FAB Position
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Bottom App Bar
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = Dashboard();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.dashboard, color: currentTab == 0 ? Colors.blue : Colors.grey,),
                        Text('Dashboard', style: TextStyle(color: currentTab == 0 ? Colors.blue : Colors.grey,))
                  ],)
                ),
                MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = Team();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.dashboard, color: currentTab == 1 ? Colors.blue : Colors.grey,),
                        Text('Team', style: TextStyle(color: currentTab == 1 ? Colors.blue : Colors.grey,))
                  ],)
                ),
              ],),
              Row(
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = Profile();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.dashboard, color: currentTab == 2 ? Colors.blue : Colors.grey,),
                        Text('Profile', style: TextStyle(color: currentTab == 2 ? Colors.blue : Colors.grey,))
                    ],)
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = Settings();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.dashboard, color: currentTab == 3 ? Colors.blue : Colors.grey,),
                        Text('Settings', style: TextStyle(color: currentTab == 3 ? Colors.blue : Colors.grey,))
                  ],)
                ),
                ],)
            ],
          ),
        ),
      ),
    );
  }
}