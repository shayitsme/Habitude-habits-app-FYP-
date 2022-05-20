import 'package:flutter/cupertino.dart';

class Habit3Field {
  static const createdTime = 'createdTime';
}

class Habit3 {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;

  Habit3({
    required this.createdTime,
    required this.title,
    this.description = '',
    this.id ='',
    this.isDone = false,
  });
}