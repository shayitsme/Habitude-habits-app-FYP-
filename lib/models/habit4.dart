import 'package:flutter/cupertino.dart';

class Habit4Field {
  static const createdTime = 'createdTime';
}

class Habit4 {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;

  Habit4({
    required this.createdTime,
    required this.title,
    this.description = '',
    this.id ='',
    this.isDone = false,
  });
}