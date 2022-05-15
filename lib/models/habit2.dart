import 'package:flutter/cupertino.dart';

class Habit2Field {
  static const createdTime = 'createdTime';
}

class Habit2 {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;

  Habit2({
    required this.createdTime,
    required this.title,
    this.description = '',
    this.id ='',
    this.isDone = false,
  });
}