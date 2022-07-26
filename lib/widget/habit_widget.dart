import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:login_with_signup/provider/habits.dart';
import 'package:provider/provider.dart';
import '../Screens/edit_habit_page.dart';
import '../models/habit.dart';
import '../utils.dart';



class HabitWidget extends StatelessWidget {
  final Habit habit;

  const HabitWidget({
    Key? key, required this.habit,}) : super(key: key);


  @override
  Widget build(BuildContext context) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          key: Key(habit.id),
          actions: [
            IconSlideAction(
              color: Colors.green,
              onTap: () => editHabit(context, habit),
              caption: 'Edit',
              icon: Icons.edit,
            )
          ],
          secondaryActions: [
            IconSlideAction(
              color: Colors.red,
              caption: 'Delete',
              onTap: () => deleteHabit(context, habit),
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
              activeColor: Theme
                  .of(context)
                  .primaryColor,
              checkColor: Colors.black,
              value: habit.isDone,
              onChanged: (_) {
                final provider = Provider.of<HabitsProvider>(
                    context, listen: false);
                final isDone = provider.toggleHabitStatus(habit);

                Utils.showSnackBar(
                  context,
                  isDone
                      ? 'Study habit completed'
                      : 'Study habit marked incomplete',
                );
              },
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    habit.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme
                          .of(context)
                          .primaryColor,
                      fontSize: 22,
                    ),
                  ),
                  if (habit.description.isNotEmpty)
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(
                        habit.description,
                        style: TextStyle(fontSize: 20, height: 1.5),
                      ),
                    )
                ],
              ),
            ),
            setDateText(habit.createdTime),
          ],
        ),
      );

  void deleteHabit(BuildContext context, Habit habit) {
    final provider = Provider.of<HabitsProvider>(context, listen: false);
    provider.removeHabit(habit);

    Utils.showSnackBar(context, 'Study habit successfully deleted');
  }

  void editHabit(BuildContext context, Habit habit) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => EditHabitPage(habit: habit),
    ),
  );

  setDateText(DateTime createdTime) {
    var formattedDate = "${createdTime.day}-${createdTime.month}-${createdTime.year}";
    return Text(formattedDate);
  }

}
