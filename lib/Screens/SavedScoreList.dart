import 'package:flutter/material.dart';
import 'package:login_with_signup/Comm/prefs.dart';
import 'package:login_with_signup/Screens/score_screen.dart';
import 'package:page_transition/page_transition.dart';

class SavedScoreList extends StatelessWidget {
  const SavedScoreList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listScore = Prefs.getStringList(Prefs.BMIScore);
    final listAge = Prefs.getStringList(Prefs.BMIAge);
    final listDate = Prefs.getStringList(Prefs.BMIDate);
    return Scaffold(
      appBar: AppBar(title: Text("Saved Scores"),),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: listScore!.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.amber,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                  borderRadius: BorderRadius.all( Radius.circular(12.0),
                  )
              ),
              child: ListTile(
                title: Text(listDate![index]),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: ScoreScreen(
                            bmiScore: double.parse(listScore[index]),
                            age: int.parse(listAge![index]),
                          ),
                          type: PageTransitionType.fade));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
