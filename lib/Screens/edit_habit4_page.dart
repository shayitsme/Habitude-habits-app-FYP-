import 'package:flutter/material.dart';
import 'package:login_with_signup/widget/habit_form_widget.dart';
import 'package:provider/provider.dart';

import '../models/habit4.dart';
import '../provider/habits4.dart';

class EditHabit4Page extends StatefulWidget {
  final Habit4 habit4;

  const EditHabit4Page({Key? key, required this.habit4}) : super(key: key);

  @override
  _EditHabit4PageState createState() => _EditHabit4PageState();
}

class _EditHabit4PageState extends State<EditHabit4Page> {
  final _formKey = GlobalKey<FormState>();

  late String title;
  late String description;

  @override
  void initState() {
    super.initState();

    title = widget.habit4.title;
    description = widget.habit4.description;
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
          appBar: AppBar(
            title: Text('Edit Habit'),
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child:Form(
  key: _formKey,
  child:  HabitFormWidget(
              title: title,
              description: description,
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onSavedHabit: saveHabit4,
            ),
          )));

  void saveHabit4() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<Habits4Provider>(context, listen: false);

      provider.updateHabit4(widget.habit4, title, description);

      Navigator.of(context).pop();
    }
  }
}


