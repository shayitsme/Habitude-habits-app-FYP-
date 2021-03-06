import 'package:flutter/material.dart';

import '../widget/add5_habit_dialog_widget.dart';
import '../widget/completed5_list_widget.dart';
import '../widget/habit5_list_widget.dart';
import 'HomeForm.dart';

class HomePage5 extends StatefulWidget {
  const HomePage5({Key? key}) : super(key: key);

  @override
  State<HomePage5> createState() => _HomePage5State();
}

class _HomePage5State extends State<HomePage5> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      Habit5ListWidget(),
      Completed5ListWidget(),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My sleep habit'),
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
        onPressed: ()  => showDialog(
          context: context,
          builder: (context) => Add5HabitDialogWidget(),
          barrierDismissible: false,
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
