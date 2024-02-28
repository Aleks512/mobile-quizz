import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  /// A class representing the Quizzler app.
  /// This class is responsible for creating the main app widget and setting up the app's UI.
  /// The app displays a quiz page where users can answer multiple-choice questions.
  /// The app has a dark theme with a black background color.
  /// The quiz page is wrapped in a safe area and padded horizontally.

  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getAnswer();
    setState(() {
      //Step 4 - Use IF/ELSE to check if the end of the quiz 've been reached . If so,
      if (quizBrain.isFinished() == true) {
        // show an alert using rFlutter_alert,
    Alert(
      context: context,
      title: "PAS MAL",
      desc: "Ce n'est qu'un début, demain ce sera encore mieux ;)",
      image: Image.asset("images/success.png"),
      buttons: [], // Fournir un tableau vide pour ne pas afficher de boutons
    ).show();
        //Step 4- reset the questionNumber,
        quizBrain.reset();

        //Step 4  - empty out the scoreKeeper.
        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 32, 93, 34),
              ),
              child: const Text(
                'Vrai',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () => checkAnswer(true),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'Faux',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () => checkAnswer(false),
            ),
          ),
        ),
        Wrap(
          children: scoreKeeper,
          spacing: 4.0, // Espace horizontal entre les icônes
          runSpacing: 4.0, // Espace vertical entre les lignes d'icônes
        ),
      ],
    );
  }
}
