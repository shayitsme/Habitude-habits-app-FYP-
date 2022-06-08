import 'package:flutter/material.dart';
import 'package:login_with_signup/widget/habit_form_widget.dart';
import 'package:provider/provider.dart';

import '../models/habit5.dart';

class EditHabit5Page extends StatefulWidget {
  final Habit5 habit5;

  const EditHabit5Page({Key? key, required this.habit5}) : super(key: key);

  @override
  _EditHabit5PageState createState() => _EditHabit5PageState();
}

class _EditHabit5PageState extends State<EditHabit5Page> {
  final _formKey = GlobalKey<FormState>();

  late String title;
  late String description;

  @override
  void initState() {
    super.initState();

    title = widget.habit5.title;
    description = widget.habit5.description;
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
          appBar: AppBar(
            title: Text('Edit Habit'),
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: HabitFormWidget(
              title: title,
              description: description,
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onSavedHabit: () {},
            ),
          ));
}

