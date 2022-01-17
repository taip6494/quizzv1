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

class body extends State<MyApp> {
  final check = Icon(Icons.check, color: Colors.green);
  final close = Icon(Icons.close, color: Colors.red);
  List<Icon> iconsList = [];
  var question = ["Le piton des neiges est un volcan de la Réunion ?","Flutter permet de faire des applications web également ?","Php est le language utilisé par Flutter ?"];

  void ajoutItems(icones){
    setState(() {
      iconsList.add(icones);
    });
  }

  @override

  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child:
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  (question[1]),
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: (
                  ElevatedButton(
                      child: Text(
                        'Vrai',
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // background (button) color
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        ajoutItems(check);
                      }

                  )
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: (
                  ElevatedButton(
                    child: Text(
                      'faux',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // background (button) color
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      ajoutItems(close);
                    },
                  )
              ),
            ),
          ),
          Row(
            children:
              iconsList,
          )
        ]
    );
  }
}
