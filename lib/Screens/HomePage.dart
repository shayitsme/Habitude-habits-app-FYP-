import 'package:flutter/material.dart';

import 'HomeForm.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My study habit'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        elevation: 4.0,
        actions: [
          IconButton(icon: Icon(Icons.home),
            onPressed: () => {
            Navigator.push(context,
            MaterialPageRoute(builder:(_)=> HomeForm()))
            },
          ),
        ],
      ),
      body: Center(),
    );
  }
}
