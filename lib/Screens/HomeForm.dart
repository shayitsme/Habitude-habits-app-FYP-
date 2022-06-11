import 'package:flutter/material.dart';
import 'package:login_with_signup/Screens/HomePage.dart';
import 'package:login_with_signup/Screens/HomePage2.dart';
import 'package:login_with_signup/Screens/HomePage3.dart';
import 'package:login_with_signup/Screens/HomePage4.dart';
import 'package:login_with_signup/Screens/HomePage5.dart';
import 'package:login_with_signup/Screens/HomePage6.dart';

import 'LoginForm.dart';
class HomeForm extends StatefulWidget {

  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Habitude Home'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        elevation: 3.0,
        leading: Container(
          padding: EdgeInsets.all(7),
          child: Image.asset("assets/images/logo.jpg"),
        ),
        actions: [
          IconButton(icon: Icon(Icons.logout),
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder:(_)=> LoginForm()))
            },
          ),
        ],
      ),

      body:
      GridView.count(
          padding: EdgeInsets.all(15),
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(8),
              child: InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder:(_)=> HomePage()));
                },
                splashColor: Colors.brown,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(Icons.school, size: 75, color: Colors.amber),
                      Text("Study", style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8),
              child: InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder:(_)=> HomePage2()));
                },
                splashColor: Colors.brown,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.self_improvement, size: 75, color: Colors.brown[400]),
                      Text("Meditation", style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8),
              child: InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder:(_)=> HomePage3()));
                },
                splashColor: Colors.brown,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.food_bank, size: 75, color: Colors.brown[400]),
                      Text("Daily Diet", style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8),
              child: InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder:(_)=> HomePage4()));
                },
                splashColor: Colors.brown,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(Icons.fitness_center, size: 75, color: Colors.amber),
                      Text("Exercise", style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8),
              child: InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder:(_)=> HomePage5()));
                },
                splashColor: Colors.brown,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(Icons.bedtime, size: 75, color: Colors.amber),
                      Text("Sleep", style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8),
              child: InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder:(_)=> HomePage6()));
                },
                splashColor: Colors.brown,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.emoji_people, size: 75, color: Colors.brown[400]),
                      Text("Self-Improvement", style: TextStyle(fontSize: 17.0)),
                    ],
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }
}




