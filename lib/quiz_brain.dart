import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
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
  void nextQuestion() {
    if (_questionNumber < _questionBank.length-1) {
      _questionNumber++;
    }
    print(_questionNumber);
    print(_questionBank.length);
  }
  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }
  //After imort of package Create a method called isFinished() here that checks to see if we have reached the last question. It should return (have an output) true if we've reached the last question and it should return false if we're not there yet.
  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      //Step 3 Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }//Step 4 Create a reset() method here that sets the questionNumber back to 0.
  void reset() {
    _questionNumber = 0;
  }
}
