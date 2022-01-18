import 'package:flutter/material.dart';

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

class MesQuestion {
  String question;
  bool reponseCorrect;
  MesQuestion(this.question, this.reponseCorrect);
}

class body extends State<MyApp> {
  final check = Icon(Icons.check, color: Colors.green);
  final close = Icon(Icons.close, color: Colors.red);
  List<Icon> iconsList = [];
  final List<MesQuestion> questionsListe = [
    MesQuestion('Le piton des neiges est un volcan de la Réunion ?', true),
    MesQuestion(
        'Flutter permet de faire des applications web également ?', false),
    MesQuestion('Php est le language utilisé par Flutter ?', true),
    MesQuestion('Qu est ce que Etienne est un bon formateur ?', true),
    MesQuestion(
        'Est ce que flutter est un bon langage de programmation?', true),
  ];
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
              (question[numberquestion]),
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
