import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:login_with_signup/models/habit5.dart';
import 'package:provider/provider.dart';

import '../Screens/edit_habit5_page.dart';
import '../provider/habits5.dart';
import '../utils.dart';




class Habit5Widget extends StatelessWidget {
  final Habit5 habit5;
  const Habit5Widget({
    Key? key, required this. habit5}) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child:Slidable(
      actionPane: SlidableDrawerActionPane(),
      key: Key(habit5.id),
      actions: [
        IconSlideAction(
          color: Colors.green,
          onTap: () => editHabit5(context, habit5),
          caption: 'Edit',
          icon: Icons.edit,
        )
      ],
      secondaryActions: [
        IconSlideAction(
          color: Colors.red,
          caption: 'Delete',
          onTap: () => deleteHabit5(context, habit5),
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
          activeColor: Colors. amber,
          checkColor: Colors.black,
          value: habit5. isDone,
          onChanged: (_) {
            final provider = Provider.of<Habits5Provider>(context, listen: false);
            final isDone = provider.toggleHabit5Status(habit5);

            Utils.showSnackBar(
              context,
              isDone ? 'Sleep habit completed' : 'Sleep habit marked incomplete',
            );
          },
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                habit5.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                  fontSize: 22,
                ),
              ),
              if (habit5.description.isNotEmpty)
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Text(
                    habit5.description,
                    style: TextStyle(fontSize: 20, height: 1.5),
                  ),
                )
            ],
          ),
        ),
        Utils.setDateText(habit5.createdTime)
      ],
    ),
  );

  void deleteHabit5(BuildContext context, Habit5 habit5) {
    final provider = Provider.of<Habits5Provider>(context, listen: false);
    provider.removeHabit5(habit5);

    Utils.showSnackBar(context, 'Sleep habit successfully deleted');
  }
  void editHabit5(BuildContext context, Habit5 habit5) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => EditHabit5Page(habit5: habit5),
    ),
  );
}