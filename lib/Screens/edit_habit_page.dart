import 'package:flutter/material.dart';
import 'package:login_with_signup/widget/habit_form_widget.dart';
import 'package:provider/provider.dart';
import '../models/habit.dart';

class EditHabitPage extends StatefulWidget {
  final Habit habit;

  const EditHabitPage({Key? key, required this.habit}) : super(key: key);

  @override
  _EditHabitPageState createState() => _EditHabitPageState();
}

class _EditHabitPageState extends State<EditHabitPage> {
  final _formKey = GlobalKey<FormState>();

  late String title;
  late String description;

  @override
  void initState() {
    super.initState();

    title = widget.habit.title;
    description = widget.habit.description;
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

