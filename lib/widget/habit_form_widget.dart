import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_with_signup/utils.dart';

class HabitFormWidget extends StatefulWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedHabit;
  final ValueChanged<DateTime> onDatePicked;



  const HabitFormWidget({Key? key,
    required this.title,
    required this.description,
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onSavedHabit,
    required this.onDatePicked,
  }) : super(key: key);

  @override
  State<HabitFormWidget> createState() => _HabitFormWidgetState();
}

class _HabitFormWidgetState extends State<HabitFormWidget> {
  String datePicked = "Pick Date";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

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

  Widget buildDate() => TextFormField(
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      labelText: 'Date',
    ),);

  Widget buildButton() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.amber),
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


