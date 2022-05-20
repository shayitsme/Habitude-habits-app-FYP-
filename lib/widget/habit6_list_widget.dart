
import 'package:flutter/cupertino.dart';
import 'package:login_with_signup/models/habit6.dart';
import 'habit6_widget.dart';


class Habit6ListWidget extends StatelessWidget {
  const Habit6ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Habit6Widget(
      habit: Habit6(
          createdTime: DateTime.now(),
          title: 'Walk the goose', id: ''
      ),
    );
  }
}
