import 'package:flutter/cupertino.dart';

class Habit5Field {
  static const createdTime = 'createdTime';
}

class Habit5 {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;

  Habit5({
    required this.createdTime,
    required this.title,
    this.description = '',
    this.id ='',
    this.isDone = false,
  });
}