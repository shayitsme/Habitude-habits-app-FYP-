import 'package:flutter/material.dart';
import 'package:login_with_signup/Screens/CalorieTrackerApp.dart';

import '../widget/add3_habit_dialog_widget.dart';
import '../widget/completed3_list_widget.dart';
import '../widget/habit3_list_widget.dart';
import 'HomeForm.dart';

class HomePage3 extends StatefulWidget {
  const HomePage3({Key? key}) : super(key: key);

  @override
  State<HomePage3> createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      Habit3ListWidget(),
      Completed3ListWidget(),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My diet habit'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.brown[400],
        elevation: 4.0,
        leading: Container(
          padding: EdgeInsets.all(7),
          child: Image.asset("assets/images/logo.jpg"),
        ),
        actions: [
          IconButton(icon: Icon(Icons.line_weight),
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder:(_)=> CalorieTrackerApp()))
            },
          ),
          IconButton(icon: Icon(Icons.home),
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder:(_)=> HomeForm()))
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.brown[400],
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
          backgroundColor: Colors.brown[400],
          onPressed: () => showDialog(
            context: context,
            builder: (context) => Add3HabitDialogWidget(),
            barrierDismissible: false,
          ),
          child: Icon(Icons.add),
        ),
    );
  }
}

