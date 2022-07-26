import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/habit6.dart';
import '../provider/habits6.dart';
import '../widget/habit2_form_widget.dart';

class EditHabit6Page extends StatefulWidget {
  final Habit6 habit6;

  const EditHabit6Page({Key? key, required this.habit6}) : super(key: key);

  @override
  _EditHabit6PageState createState() => _EditHabit6PageState();
}

class _EditHabit6PageState extends State<EditHabit6Page> {
  final _formKey = GlobalKey<FormState>();

  late String title;
  late String description;
  late DateTime createdTime;

  @override
  void initState() {
    super.initState();

    title = widget.habit6.title;
    description = widget.habit6.description;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Edit Habit'),
        backgroundColor: Colors.brown[400],
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Habit2FormWidget(
              title: title,
              description: description,
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onSavedHabit: saveHabit6,
              onDatePicked: (val) {
                setState(() {
                  createdTime = val;
                });
              },
            ),
          )));

  void saveHabit6() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<Habits6Provider>(context, listen: false);

      provider.updateHabit6(widget.habit6, title, description,createdTime);

      Navigator.of(context).pop();
    }
  }
}