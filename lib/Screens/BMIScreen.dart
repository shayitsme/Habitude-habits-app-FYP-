import 'dart:math';

import 'package:flutter/material.dart';
import 'package:login_with_signup/Comm/prefs.dart';
import 'package:login_with_signup/Screens/SavedScoreList.dart';
import 'package:login_with_signup/Screens/score_screen.dart';
import 'package:login_with_signup/utils.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import '../widget/age_weight_widget.dart';
import '../widget/gender_widget.dart';
import '../widget/height_widget.dart';
import 'HomeForm.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  int _gender = 0;
  int _height = 150;
  int _age = 30;
  int _weight = 50;
  bool _isFinished = false;
  double _bmiScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("BMI Calculator"),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.amber,
          elevation: 2.0,
          leading: Container(
            padding: EdgeInsets.all(7),
            child: Image.asset("assets/images/logo.jpg"),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () => {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomeForm()))
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Card(
              elevation: 12,
              shape: const RoundedRectangleBorder(),
              child: Column(
                children: [
                  //Lets create widget for gender selection
                  GenderWidget(
                    onChange: (genderVal) {
                      _gender = genderVal;
                    },
                  ),
                  HeightWidget(
                    onChange: (heightVal) {
                      _height = heightVal;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AgeWeightWidget(
                          onChange: (ageVal) {
                            _age = ageVal;
                          },
                          title: "Age",
                          initValue: 30,
                          min: 0,
                          max: 100),
                      AgeWeightWidget(
                          onChange: (weightVal) {
                            _weight = weightVal;
                          },
                          title: "Weight(Kg)",
                          initValue: 50,
                          min: 0,
                          max: 200)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 60),
                    child: SwipeableButtonView(
                        isFinished: _isFinished,
                        onFinish: () async {
                          await Navigator.push(
                              context,
                              PageTransition(
                                  child: ScoreScreen(
                                    bmiScore: _bmiScore,
                                    age: _age,
                                  ),
                                  type: PageTransitionType.fade));

                          setState(() {
                            _isFinished = false;
                          });
                        },
                        onWaitingProcess: () {
                          //Calculate BMI here
                          calculateBmi();

                          Future.delayed(Duration(seconds: 1), () {
                            setState(() {
                              _isFinished = true;
                            });
                          });
                        },
                        activeColor: Colors.amber,
                        buttonWidget: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        ),
                        buttonText: "CALCULATE"),
                  ),
                  ElevatedButton(
                      onPressed: () => {
                        if (Prefs.getStringList(Prefs.BMIScore)!.length > 0)
                          {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: SavedScoreList(),
                                    type: PageTransitionType.fade))
                          }
                        else
                          {
                            Utils.showSnackBar(
                                context, "No Saved Score Found")
                          }
                      },
                      child: Text("View Old Score"))
                ],
              ),
            ),
          ),
        ));
  }

  void calculateBmi() {
    _bmiScore = _weight / pow(_height / 100, 2);
  }
}
