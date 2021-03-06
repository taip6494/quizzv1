import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizbrain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  State<MyApp> createState() => body();
}

class body extends State<MyApp> {
  final check = Icon(Icons.check, color: Colors.green);
  final close = Icon(Icons.close, color: Colors.red);
  List<Icon> iconsList = [];

  void ajoutItems(icones) {
    setState(() {
      iconsList.add(icones);
    });
  }

  void checkAnswer(bool reponseutilisateur) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: "Parti Fini!",
          desc: "Votre parti est fini",
          buttons: [
            DialogButton(
              child: Text(
                "C'est top",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        quizBrain.reset();
        iconsList = [];
      } else {
        if (reponseutilisateur == correctAnswer) {
          iconsList.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          iconsList.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }

        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Expanded(
        flex: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              quizBrain.getQuestionText(),
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: (ElevatedButton(
              child: Text(
                'Vrai',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // background (button) color
                onPrimary: Colors.white,
              ),
              onPressed: () {
                checkAnswer(true);
              })),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: (ElevatedButton(
              child: Text(
                'faux',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // background (button) color
                onPrimary: Colors.white,
              ),
              onPressed: () {
                checkAnswer(false);
              })),
        ),
      ),
      Row(
        children: iconsList,
      )
    ]);
  }
}
