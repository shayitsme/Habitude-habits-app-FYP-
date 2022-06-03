import 'package:flutter/material.dart';

class Habit2FormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedHabit;

  const Habit2FormWidget({Key? key,
    required this.title,
    required this.description,
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onSavedHabit
  }) : super(key: key);


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
              buildButton(),
            ]
        ),
      );

  Widget buildTitle() =>
      TextFormField(
        maxLines: 1,
        initialValue: title,
        onChanged: onChangedTitle,
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
    initialValue: description,
    onChanged: onChangedDescription,
    decoration: InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      labelText: 'Description',
    ),
  );
  Widget buildButton() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.brown[400]),
      ),
      onPressed: onSavedHabit,
      child: Text('Save'),
    ),
  );

}