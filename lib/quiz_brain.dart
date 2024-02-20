import 'question.dart';

class QuizBrain {
  List<Question> _questionBank = [
    Question('La Tour Eiffel se trouve à Londres.', false),
    Question('La lumière du soleil met environ 8 minutes à atteindre la Terre.',
        true),
    Question('Vénus est la planète la plus proche du Soleil.', false),
    Question('Le chocolat est toxique pour les chiens.', true),
    Question('Le cheval blanc d\'Henri IV était noir.', false),
    Question('Les humains partagent 50% de leur ADN avec les bananes.', true),
    Question('L\'eau bout à 100 degrés Celsius, au niveau de la mer.', true),
    Question('Le coeur d\'une crevette est situé dans sa tête.', true),
    Question('Un octogone a cinq côtés.', false),
    Question('Mona Lisa a été peinte par Vincent Van Gogh.', false),
    Question('La capitale de l\'Australie est Sydney.', false),
    Question('Les diamants sont faits de charbon.', true),
    Question('Un millénaire compte 100 ans.', false),
    Question('Les poissons sont des animaux à sang chaud.', false),
    Question('Le son voyage plus vite dans l\'eau que dans l\'air.', true),
    Question('Le Mont Everest est le point le plus haut de la Terre.', true),
    Question('Le kiwi est originaire de Nouvelle-Zélande.', false),
    Question('La vitamine C prévient le scorbut.', true),
    Question('Les araignées ont six pattes.', false),
    Question('Le cœur humain bat à droite du corps.', false),
  ];

  String getQuestionText(int questionNumber) {
    return _questionBank[questionNumber].questionText;
  }
    bool getAnwer(int questionNumber) {
    return _questionBank[questionNumber].questionAnswer;
  }



}
