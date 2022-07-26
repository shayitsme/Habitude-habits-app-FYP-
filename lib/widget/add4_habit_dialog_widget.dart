import 'package:flutter/material.dart';
import 'package:login_with_signup/models/habit4.dart';
import 'package:provider/provider.dart';
import '../provider/habits4.dart';
import 'habit4_form_widget.dart';

class Add4HabitDialogWidget extends StatefulWidget {
  const Add4HabitDialogWidget({Key? key}) : super(key: key);

  @override
  State<Add4HabitDialogWidget> createState() => _Add4HabitDialogWidgetState();
}

class _Add4HabitDialogWidgetState extends State<Add4HabitDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  DateTime createdTime = DateTime.now();

  @override
  Widget build(BuildContext context)  => AlertDialog(
    content:  Form(
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
          Habit4FormWidget(
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) => setState(() => this.description = description),
            onSavedHabit: addHabit4, description: '', title: '',
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

  void addHabit4() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final habit4 = Habit4(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: createdTime,
      );
      final provider = Provider.of<Habits4Provider>(context, listen: false);
      provider.addHabit4(habit4);

      Navigator.of(context).pop();
    }
  }
}




