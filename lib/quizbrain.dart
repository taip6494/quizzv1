import 'question.dart';

class QuizBrain {
  int _numberquestion = 0;

  List<Question> _questionsListe = [
    Question('Le piton des neiges est un volcan de la Réunion ?', true),
    Question('Flutter permet de faire des applications web également ?', false),
    Question('Php est le language utilisé par Flutter ?', true),
  ];

  bool getQuestionAnswer() {
    return _questionsListe[_numberquestion].questionAnswer;
  }

  String getQuestionText() {
    return _questionsListe[_numberquestion].questionText;
  }

  void nextQuestion() {
    if (_numberquestion < _questionsListe.length - 1) _numberquestion++;
  }

  bool isFinished() {
    if (_numberquestion >= _questionsListe.length - 1) {
      print('retourne vrai');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _numberquestion = 0;
  }
}
