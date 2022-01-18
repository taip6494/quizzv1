class MesQuestion {
  String question;
  bool reponseCorrect;
  MesQuestion(this.question, this.reponseCorrect);
  final List<MesQuestion> questionsListe = [
    MesQuestion('Le piton des neiges est un volcan de la Réunion ?', true),
    MesQuestion(
        'Flutter permet de faire des applications web également ?', false),
    MesQuestion('Php est le language utilisé par Flutter ?', true),
    MesQuestion('Qu est ce que Etienne est un bon formateur ?', true),
    MesQuestion(
        'Est ce que flutter est un bon langage de programmation?', true),
  ];
}
