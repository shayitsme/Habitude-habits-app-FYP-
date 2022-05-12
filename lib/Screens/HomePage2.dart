import 'package:flutter/material.dart';

import 'HomeForm.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My meditation habit'),
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
