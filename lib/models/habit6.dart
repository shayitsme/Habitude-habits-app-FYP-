import 'package:flutter/cupertino.dart';

class Habit6Field {
  static const createdTime = 'createdTime';
}

class Habit6 {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;

  Habit6({
    required this.createdTime,
    required this.title,
    this.description = '',
    this.id ='',
    this.isDone = false,
  });
}