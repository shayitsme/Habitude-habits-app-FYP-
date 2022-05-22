import 'package:flutter/cupertino.dart';

class HabitField {
  static const createdTime = 'createdTime';
}

class Habit {
   DateTime createdTime;
   String title;
   String id;
   String description;
   bool isDone;

  Habit({
    required this.createdTime,
    required this.title,
    this.description = '',
    this.id = '',
    this.isDone = false,
  });
}
