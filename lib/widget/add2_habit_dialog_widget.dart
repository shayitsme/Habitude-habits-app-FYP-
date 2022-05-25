import 'package:flutter/material.dart';
import 'package:login_with_signup/models/habit2.dart';
import 'package:provider/provider.dart';

import '../provider/habits2.dart';
import 'habit2_form_widget.dart';

class Add2HabitDialogWidget extends StatefulWidget {
  const Add2HabitDialogWidget({Key? key}) : super(key: key);

  @override
  State<Add2HabitDialogWidget> createState() => _Add2HabitDialogWidgetState();
}

class _Add2HabitDialogWidgetState extends State<Add2HabitDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context)  => AlertDialog(
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
        Habit2FormWidget(
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedDescription: (description) => setState(() => this.description = description),
          onSavedHabit: addHabit2, description: '', title: '',
        ),

      ],
    ),
  ),
  );
  void addHabit2() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final habit2 = Habit2(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: DateTime.now(),
      );
      final provider = Provider.of<Habits2Provider>(context, listen: false);
      provider.addHabit2(habit2);

      Navigator.of(context).pop();
    }
  }
}


