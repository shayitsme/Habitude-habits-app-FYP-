import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:login_with_signup/models/habit4.dart';
import 'package:provider/provider.dart';

import '../Screens/edit_habit4_page.dart';
import '../provider/habits4.dart';
import '../utils.dart';




class Habit4Widget extends StatelessWidget {
  final Habit4 habit4;

  const Habit4Widget({
    Key? key, required this.habit4}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          key: Key(habit4.id),
          actions: [
            IconSlideAction(
              color: Colors.green,
              onTap: () => editHabit4(context, habit4),
              caption: 'Edit',
              icon: Icons.edit,
            )
          ],
          secondaryActions: [
            IconSlideAction(
              color: Colors.red,
              caption: 'Delete',
              onTap: () => deleteHabit4(context, habit4),
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
              activeColor: Colors.amber,
              checkColor: Colors.black,
              value: habit4.isDone,
              onChanged: (_) {
                final provider = Provider.of<Habits4Provider>(
                    context, listen: false);
                final isDone = provider.toggleHabit4Status(habit4);

                Utils.showSnackBar(
                  context,
                  isDone
                      ? 'Exercise habit completed'
                      : 'Exercise habit marked incomplete',
                );
              },
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    habit4.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                      fontSize: 22,
                    ),
                  ),
                  if (habit4.description.isNotEmpty)
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(
                        habit4.description,
                        style: TextStyle(fontSize: 20, height: 1.5),
                      ),
                    )
                ],
              ),
            ),
            Utils.setDateText(habit4.createdTime)
          ],
        ),
      );

  void deleteHabit4(BuildContext context, Habit4 habit4) {
    final provider = Provider.of<Habits4Provider>(context, listen: false);
    provider.removeHabit4(habit4);

    Utils.showSnackBar(context, 'Exercise habit successfully deleted');
  }
  void editHabit4(BuildContext context, Habit4 habit4) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => EditHabit4Page(habit4: habit4),
    ),
  );
}
