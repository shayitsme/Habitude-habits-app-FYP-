import 'package:flutter/material.dart';

import '../widget/add_habit_dialog_widget.dart';
import '../widget/completed_list_widget.dart';
import '../widget/habit_list_widget.dart';
import 'HomeForm.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      HabitListWidget(),
      CompletedListWidget(),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My study habit'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        elevation: 4.0,
        leading: Container(
          padding: EdgeInsets.all(7),
          child: Image.asset("assets/images/logo.jpg"),
        ),
        actions: [
          IconButton(icon: Icon(Icons.home),
            onPressed: () =>
            {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => HomeForm()))
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orangeAccent,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) =>
            setState(() {
              selectedIndex = index;
            }),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.fact_check_outlined),
              label: 'Habits'),
          BottomNavigationBarItem(icon: Icon(Icons.done, size: 28),
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
          builder: (context) => AddHabitDialogWidget(),
          barrierDismissible: false,
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}

