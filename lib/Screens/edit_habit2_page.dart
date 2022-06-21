import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/habit2.dart';
import '../provider/habits2.dart';
import '../widget/habit2_form_widget.dart';

class EditHabit2Page extends StatefulWidget {
  final Habit2 habit2;

  const EditHabit2Page({Key? key, required this.habit2}) : super(key: key);

  @override
  _EditHabit2PageState createState() => _EditHabit2PageState();
}

class _EditHabit2PageState extends State<EditHabit2Page> {
  final _formKey = GlobalKey<FormState>();

  late String title;
  late String description;

  @override
  void initState() {
    super.initState();

    title = widget.habit2.title;
    description = widget.habit2.description;
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
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
                  onSavedHabit: saveHabit2,
                ),
              )));

  void saveHabit2() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<Habits2Provider>(context, listen: false);

      provider.updateHabit2(widget.habit2, title, description);

      Navigator.of(context).pop();
    }
  }

}


