import 'package:flutter/material.dart';
import 'package:login_with_signup/Comm/prefs.dart';
import 'package:login_with_signup/utils.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share/share.dart';

import 'BMIScreen.dart';

class ScoreScreen extends StatelessWidget {
  final double bmiScore;

  final int age;

  String? bmiStatus;

  String? bmiInterpretation;

  Color? bmiStatusColor;

  bool added = false;

  ScoreScreen({Key? key, required this.bmiScore, required this.age})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text("BMI Score"),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.amber,
          elevation: 2.0,
          leading: Container(
            padding: EdgeInsets.all(7),
            child: Image.asset("assets/images/logo.jpg"),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.scale),
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => BMIScreen()))
                }),
          ]),
      body: Container(
          padding: const EdgeInsets.all(12),
          child: Card(
              elevation: 12,
              shape: const RoundedRectangleBorder(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Your Score",
                      style: TextStyle(fontSize: 30, color: Colors.blue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PrettyGauge(
                      gaugeSize: 300,
                      minValue: 0,
                      maxValue: 40,
                      segments: [
                        GaugeSegment('UnderWeight', 18.5, Colors.red),
                        GaugeSegment('Normal', 6.4, Colors.green),
                        GaugeSegment('OverWeight', 5, Colors.orange),
                        GaugeSegment('Obese', 10.1, Colors.pink),
                      ],
                      valueWidget: Text(
                        bmiScore.toStringAsFixed(1),
                        style: const TextStyle(fontSize: 40),
                      ),
                      currentValue: bmiScore.toDouble(),
                      needleColor: Colors.amber,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      bmiStatus!,
                      style: TextStyle(fontSize: 20, color: bmiStatusColor!),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      bmiInterpretation!,
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Re-calculate")),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Share.share(
                                  "Your BMI is ${bmiScore.toStringAsFixed(1)} at age $age");
                            },
                            child: const Text("Share")),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (!added) {
                                var listScore =
                                Prefs.getStringList(Prefs.BMIScore);
                                var listAge = Prefs.getStringList(Prefs.BMIAge);
                                var listDate =
                                Prefs.getStringList(Prefs.BMIDate);
                                listScore?.add(bmiScore.toString());
                                listAge?.add(age.toString());
                                listDate?.add(DateTime.now().toString());

                                Prefs.setStringList(Prefs.BMIScore, listScore!);
                                Prefs.setStringList(Prefs.BMIAge, listAge!);
                                Prefs.setStringList(Prefs.BMIDate, listDate!);
                                Utils.showSnackBar(context, 'Score saved');
                                added = true;
                              } else {
                                Utils.showSnackBar(context, 'Already saved');
                              }
                            },
                            child: const Text("Save")),
                      ],
                    )
                  ]))),
    );
  }

  void setBmiInterpretation() {
    if (bmiScore > 30) {
      bmiStatus = "Obese";
      bmiInterpretation = "Please observe daily lifestyle to reduce obesity";
      bmiStatusColor = Colors.pink;
    } else if (bmiScore >= 25) {
      bmiStatus = "Overweight";
      bmiInterpretation = "Do exercise regularly to reduce the weight";
      bmiStatusColor = Colors.orange;
    } else if (bmiScore >= 18.5) {
      bmiStatus = "Normal";
      bmiInterpretation = "Enjoy, You are fit!";
      bmiStatusColor = Colors.green;
    } else if (bmiScore < 18.5) {
      bmiStatus = "Underweight";
      bmiInterpretation = "Eat more & exercise to increase your weight";
      bmiStatusColor = Colors.red;
    }
  }
}