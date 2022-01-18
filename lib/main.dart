import 'package:flutter/material.dart';
import 'package:quizzv1/quizbrain.dart';

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
  int numberquestion = 0;

  void ajoutItems(icones) {
    setState(() {
      iconsList.add(icones);
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
              questionsListe[numberquestion].question,
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
                bool bonnereponse = reponses[numberquestion];
                if (iconsList.length != question.length) {
                  if (bonnereponse == true) {
                    ajoutItems(check);
                  } else {
                    ajoutItems(close);
                  }
                  if (numberquestion < question.length - 1) numberquestion++;
                }
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
                bool bonnereponse = reponses[numberquestion];
                if (iconsList.length != question.length) {
                  if (bonnereponse == true) {
                    ajoutItems(close);
                  } else {
                    ajoutItems(check);
                  }
                  if (numberquestion < question.length - 1) numberquestion++;
                }
              })),
        ),
      ),
      Row(
        children: iconsList,
      )
    ]);
  }
}
