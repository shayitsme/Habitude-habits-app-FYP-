import 'package:flutter/material.dart';
import 'package:login_with_signup/models/habit.dart';
import 'package:provider/provider.dart';
import '../provider/habits.dart';
import 'habit_form_widget.dart';

class AddHabitDialogWidget extends StatefulWidget {
  const AddHabitDialogWidget({Key? key}) : super(key: key);

  @override
  State<AddHabitDialogWidget> createState() => _AddHabitDialogWidgetState();
}

class _AddHabitDialogWidgetState extends State<AddHabitDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  DateTime createdTime = DateTime.now();


  @override
  Widget build(BuildContext context) =>
      AlertDialog(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Habit',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 8),
              HabitFormWidget(
                onChangedTitle: (title) => setState(() => this.title = title),
                onChangedDescription: (description) =>
                    setState(() => this.description = description),
                onSavedHabit: addHabit,
                title: '',
                description: '',
                onDatePicked: (v) {
                  setState(() {
                    createdTime = v;
                  });
                },
              ),
            ],
          ),
        ),
      );

  void addHabit() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final habit = Habit(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: createdTime,
      );
      final provider = Provider.of<HabitsProvider>(context, listen: false);
      provider.addHabit(habit);

      Navigator.of(context).pop();
    }
  }
}
