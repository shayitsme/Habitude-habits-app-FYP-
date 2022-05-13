import 'package:flutter/material.dart';

import '../widget/add2_habit_dialog_widget.dart';
import 'HomeForm.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      Container(),
      Container(),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My meditation habit'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        elevation: 4.0,
        leading: Container(
          padding: EdgeInsets.all(7),
          child: Image.asset("assets/images/logo.jpg"),
        ),
        actions: [
          IconButton(icon: Icon(Icons.home),
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder:(_)=> HomeForm()))
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orangeAccent,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.fact_check_outlined),
              label: 'Habits'),
          BottomNavigationBarItem(icon: Icon(Icons.done, size:28),
              label: 'Completed'),
        ],
      ),
        body: tabs[selectedIndex],
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.amber,
          onPressed: () => showDialog(
            context: context,
            builder: (context) => Add2HabitDialogWidget(),
            barrierDismissible: false,
          ),
          child: Icon(Icons.add),
        ),
    );
  }
}
