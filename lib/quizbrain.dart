import 'question.dart';

class QuizBrain {
  int _numberquestion = 0;

  List<Question> _questionsListe = [
    Question('Le piton des neiges est un volcan de la Réunion ?', true),
    Question('Le piton des neiges est un volcan de la Réunion ?', false),
    Question('Le piton des neiges est un volcan de la Réunion ?', true),
  ];

  bool getQuestionAnswer() {
    return _questionsListe[_numberquestion].questionAnswer;
  }

  String getQuestionText() {
    return _questionsListe[_numberquestion].questionText;
  }
}
