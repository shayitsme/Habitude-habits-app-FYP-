import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../provider/habits2.dart';
import 'habit2_widget.dart';



class Habit2ListWidget extends StatelessWidget {
  const Habit2ListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Habits2Provider>(context);
    final habits2 = provider.habit2;

    return habits2.isEmpty
        ? Center(
      child: Text(
        'No Prayer habits',
        style: TextStyle(fontSize: 20),
      ),
    )

        :ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      separatorBuilder: (context, index) => Container(height: 8),
      itemCount: habits2.length,
      itemBuilder: (context, index) {
        final habit2 = habits2[index];

        return Habit2Widget(habit2: habit2);
      },
    );
  }
}


