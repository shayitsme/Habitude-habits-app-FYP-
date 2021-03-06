import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:login_with_signup/models/habit3.dart';
import 'package:provider/provider.dart';

import '../Screens/edit_habit3_page.dart';
import '../provider/habits3.dart';
import '../utils.dart';




class Habit3Widget extends StatelessWidget {
  final Habit3 habit3;
  const Habit3Widget({
    Key? key, required this. habit3}) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child:Slidable(
      actionPane: SlidableDrawerActionPane(),
      key: Key(habit3.id),
      actions: [
        IconSlideAction(
          color: Colors.green,
          onTap: () => editHabit3(context, habit3),
          caption: 'Edit',
          icon: Icons.edit,
        )
      ],
      secondaryActions: [
        IconSlideAction(
          color: Colors.red,
          caption: 'Delete',
          onTap: () => deleteHabit3(context, habit3),
          icon: Icons.delete,
        )
      ],
      child: buildHabit(context),
    ),
  );



  Widget buildHabit(BuildContext context)=>Container(
    color: Colors.white,
    padding: EdgeInsets.all(20),
    child: Row(
      children: [
        Checkbox(
          activeColor: Colors. brown[400],
          checkColor: Colors.black,
          value: habit3. isDone,
          onChanged: (_) {
            final provider = Provider.of<Habits3Provider>(context, listen: false);
            final isDone = provider.toggleHabit3Status(habit3);

            Utils.showSnackBar(
              context,
              isDone ? 'Diet habit completed' : 'Diet habit marked incomplete',
            );
          },
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                habit3.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[400],
                  fontSize: 22,
                ),
              ),
              if (habit3.description.isNotEmpty)
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(
                    habit3.description,
                    style: TextStyle(fontSize: 20, height: 1.5),
                  ),
                )
            ],
          ),
        ),
        Utils.setDateText(habit3.createdTime)
      ],
    ),
  );

  void deleteHabit3(BuildContext context, Habit3 habit3) {
    final provider = Provider.of<Habits3Provider>(context, listen: false);
    provider.removeHabit3(habit3);

    Utils.showSnackBar(context, 'Diet habit successfully deleted');
  }
  void editHabit3(BuildContext context, Habit3 habit3) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => EditHabit3Page(habit3: habit3),
    ),
  );
}
