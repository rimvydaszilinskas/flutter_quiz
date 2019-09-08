import 'package:first/utils/question.dart';

class Quiz {
  List<Question> _questions;
  int _currentQuestionIndex = -1;
  int _score = 0;

  Quiz(this._questions) {
    this._questions.shuffle();
  }

  List<Question> get questions => _questions;
  int get length => _questions.length;
  int get currentQuestionNumber => _currentQuestionIndex+1;
  int get score => _score;

  Question get nextQuestion {
    this._currentQuestionIndex++;

    if (this._currentQuestionIndex >= length)
      return null;
    
    return this._questions[this._currentQuestionIndex];
  }

  void answer(bool isCorrect) {
    if (isCorrect)
      this._score++;
  }
}