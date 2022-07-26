import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/DeveloperSeries.dart';
import '../provider/habits.dart';
import '../widget/BarChartContent.dart';
import '../widget/ChartContainer.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({Key? key}) : super(key: key);

  @override
  State<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {

  List<DeveloperSeries> data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [
      DeveloperSeries(
          year: "Study",
          completedHabits: 40000,
          totalHabits: 100000,
          barColor: Colors.red),
      DeveloperSeries(
        year: "Prayer",
        completedHabits: 5000,
        totalHabits: 100000,
        barColor: Colors.green,
      ),
      DeveloperSeries(
        year: "Daily Diet",
        completedHabits: 40000,
        totalHabits: 100000,
        barColor: Colors.yellow,
      ),
      DeveloperSeries(
        year: "Exercise",
        completedHabits: 35000,
        totalHabits: 100000,
        barColor: Colors.orange,
      ),
      DeveloperSeries(
        year: "Sleep",
        completedHabits: 45000,
        totalHabits: 100000,
        barColor: Colors.blue,
      ),
      DeveloperSeries(
        year: "Self-Improvement",
        completedHabits: 5000,
        totalHabits: 100000,
        barColor: Colors.purpleAccent,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(),
        body: Container(
          color: Color(0xfff0f0f0),
          child: ListView(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
            children: <Widget>[
              ChartContainer(
                  title: 'Habits Completed Graph',
                  color: Colors.orangeAccent,
                  chart: BarChartContent()
              ),
            ],
          ),
        ));
  }

  List<BarChartData> _chartSections(List<DeveloperSeries> sectors) {
    final List<BarChartData> list = [];
    for (var sector in sectors) {
      const double radius = 40.0;
      final data = BarChartData(
          backgroundColor: sector.barColor,
          baselineY: double.parse(sector.completedHabits.toString()),
          maxY: 100000,
          titlesData: FlTitlesData(topTitles: AxisTitles(axisNameWidget: Text(sector.year))));
      list.add(data);
    }
    return list;
  }

  HintTitleColors() {
    return Expanded(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return _item(index);
          }),
    );
  }

  _item(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data[index].year),
          SizedBox(width: 20),
          CircleAvatar(
            radius: 8,
            backgroundColor: data[index].barColor,
          )
        ],
      ),
    );
  }
}
