import 'package:flutter/material.dart';
import 'package:flutter_app/quizapp.dart';
// import 'quizpage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_app/LernQuiz.dart';
//import 'quiz_funktion.dart';

//QuizFunktion quiz = new QuizFunktion();

//void main() => runApp(QuizApp());
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => LearnQuiz(),
      '/quizapp': (context) => QuizPage(),
    },
  ));
}
