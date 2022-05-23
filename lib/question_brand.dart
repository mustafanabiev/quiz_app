import 'package:flutter/cupertino.dart';
import 'package:flutter_application_6/question_class.dart';

class QuestionBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('Кыргызстанда 7 область бар ...', true),
    Question('Дуйнодо 5  океан бар ...', false),
    Question('Сен кыргызсын ...', true),
    Question('Кыргыз эли байыркы эл ...', true),
    Question('FLUTTER KYRGYZ компаниясы дуйнолук компания болот ...', true),
  ];

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  void getNextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      print('quiz has run out of questions');
      return true;
    } else {
      return false;
    }
  }
}
