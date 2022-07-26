import 'package:flutter/material.dart';

import '../utils.dart';

class Habit2FormWidget extends StatefulWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedHabit;
  final ValueChanged<DateTime> onDatePicked;

  const Habit2FormWidget({Key? key,
    required this.title,
    required this.description,
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onSavedHabit,
    required this.onDatePicked
  }) : super(key: key);

  @override
  State<Habit2FormWidget> createState() => _Habit2FormWidgetState();
}

class _Habit2FormWidgetState extends State<Habit2FormWidget> {
  String datePicked = "Pick Date";
  @override
  Widget build(BuildContext context) =>
      SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTitle(),
              SizedBox(height: 8),
              buildDescription(),
              SizedBox(height: 32),
              TextButton(onPressed: ()=>{
                pickDateNow(context),
              }, child: Text(datePicked,)),
              buildButton(),
            ]
        ),
      );

  Widget buildTitle() =>
      TextFormField(
        maxLines: 1,
        initialValue: widget.title,
        onChanged: widget.onChangedTitle,
        validator: (title) {
          if (title!.isEmpty) {
            return 'The title cannot be empty';
          }
          return null;
        },

        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          labelText: 'Title',
        ),
      );

  Widget buildDescription() => TextFormField(
    maxLines: 3,
    initialValue: widget.description,
    onChanged: widget.onChangedDescription,
    decoration: InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      labelText: 'Description/Notes',
    ),
  );

  Widget buildButton() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.brown[400]),
      ),
      onPressed: widget.onSavedHabit,
      child: Text('Save'),
    ),
  );

  pickDateNow(context) async {
    final dateIsPicked = await Utils.showDateDialog(context);
    setState(() {
      datePicked = dateIsPicked!.toIso8601String();
      widget.onDatePicked.call(dateIsPicked);
    });
  }
}