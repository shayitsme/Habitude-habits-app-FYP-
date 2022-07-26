import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../provider/habits.dart';
import '../provider/habits2.dart';
import '../provider/habits3.dart';
import '../provider/habits4.dart';
import '../provider/habits5.dart';
import '../provider/habits6.dart';
import '../utils.dart';

class BarChartContent extends StatelessWidget {

  final bottomStyle = TextStyle(color: Colors.white,
      fontSize: 8,
      fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    final provider1 = Provider.of<HabitsProvider>(context);
    final provider2 = Provider.of<Habits2Provider>(context);
    final provider3 = Provider.of<Habits3Provider>(context);
    final provider4 = Provider.of<Habits4Provider>(context);
    final provider5 = Provider.of<Habits5Provider>(context);
    final provider6 = Provider.of<Habits6Provider>(context);

    var maxGraph = (Utils.getGraphMaxValue(provider1,provider2,provider3,provider4,provider5,provider6) + 4);
    print(maxGraph.toString());
    var dividedValues = maxGraph/4;

    List<BarChartGroupData> barChartGroupData = [
      BarChartGroupData(x: 1, barRods: [
        BarChartRodData(fromY: 0, width: 12,color: Colors.lightBlue, toY: double.parse(provider1.habitsCompleted.length.toString())),
      ]),
      BarChartGroupData(x: 2, barRods: [
        BarChartRodData(fromY: 0,width: 12, color: Colors.lightBlue, toY: double.parse(provider2.habits2Completed.length.toString())),
      ]),
      BarChartGroupData(x: 3, barRods: [
        BarChartRodData(fromY: 0, width: 12,color: Colors.lightBlue, toY: double.parse(provider3.habits3Completed.length.toString())),
      ]),
      BarChartGroupData(x: 4, barRods: [
        BarChartRodData(fromY: 0,width: 12, color: Colors.lightBlue, toY: double.parse(provider4.habits4Completed.length.toString())),
      ]),
      BarChartGroupData(x: 5, barRods: [
        BarChartRodData(fromY: 0, width: 12,color: Colors.lightBlue, toY: double.parse(provider5.habits5Completed.length.toString())),
      ]),
      BarChartGroupData(x: 6, barRods: [
        BarChartRodData(fromY: 0, width: 12,color: Colors.lightBlue, toY: double.parse(provider6.habits6Completed.length.toString())),
      ]),];

    return BarChart(BarChartData(

      titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                switch (value.toInt()) {
                  case 1:
                    return Text('Study',style: bottomStyle,);
                  case 2:
                    return Text('Prayer',style: bottomStyle,);
                  case 3:
                    return Text('Daily Diet',style: bottomStyle,);
                  case 4:
                    return Text('Exercise',style: bottomStyle,);
                  case 5:
                    return Text('Sleep',style: bottomStyle,);
                  case 6:
                    return Text('Self-Imp',style: bottomStyle,);
                }
                return Text('');
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              interval: dividedValues,
              showTitles: true,
              getTitlesWidget: (value, meta) {
                if (value.toInt() == 0)
                  return Text('');
                else
                  return Text(value.toInt().toString());
              },
            ),
          )),

      alignment: BarChartAlignment.spaceEvenly,
      maxY: double.parse(maxGraph.toString()),
      barGroups: barChartGroupData,
    ));
  }
}
