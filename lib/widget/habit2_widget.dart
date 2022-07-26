import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:login_with_signup/models/habit2.dart';
import 'package:provider/provider.dart';

import '../Screens/edit_habit2_page.dart';
import '../provider/habits2.dart';
import '../utils.dart';




class Habit2Widget extends StatelessWidget {
  final Habit2 habit2;

  const Habit2Widget({
    Key? key, required this.habit2}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          key: Key(habit2.id),
          actions: [
            IconSlideAction(
              color: Colors.green,
              onTap: () => editHabit2(context, habit2),
              caption: 'Edit',
              icon: Icons.edit,
            )
          ],
          secondaryActions: [
            IconSlideAction(
              color: Colors.red,
              caption: 'Delete',
              onTap: () => deleteHabit(context, habit2),
              icon: Icons.delete,
            )
          ],
          child: buildHabit(context),
        ),
      );


  Widget buildHabit(BuildContext context) =>
      Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
              activeColor: Colors.brown[400],
              checkColor: Colors.black,
              value: habit2.isDone,
              onChanged: (_) {
                final provider = Provider.of<Habits2Provider>(context, listen: false);
                final isDone = provider.toggleHabit2Status(habit2);

                Utils.showSnackBar(
                  context,
                  isDone ? 'Prayer habit completed' : 'Prayer habit marked incomplete',
                );
              },
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    habit2.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[400],
                      fontSize: 22,
                    ),
                  ),
                  if (habit2.description.isNotEmpty)
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(
                        habit2.description,
                        style: TextStyle(fontSize: 20, height: 1.5),
                      ),
                    )
                ],
              ),
            ),
            Utils.setDateText(habit2.createdTime)
          ],
        ),
      );

  void deleteHabit(BuildContext context, Habit2 habit2) {
    final provider = Provider.of<Habits2Provider>(context, listen: false);
    provider.removeHabit2(habit2);

    Utils.showSnackBar(context, 'Prayer habit successfully deleted');
  }
  void editHabit2(BuildContext context, Habit2 habit2) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => EditHabit2Page(habit2: habit2),
    ),
  );

}

