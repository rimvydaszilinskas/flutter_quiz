import 'package:first/components/answer_button.dart';
import 'package:first/components/overlay_art.dart';
import 'package:first/components/question_text.dart';
import 'package:first/pages/landing_page.dart';
import 'package:first/pages/score_page.dart';
import 'package:flutter/material.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';

class QuizPage extends StatefulWidget {
    @override
    State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

    Question currentQuestion;
    Quiz quiz = new Quiz([
        new Question('The answer is true', true),
        new Question('The answer is true', true),
        new Question('The answer is false', false),
        new Question('The answer is false', false)
    ]);
    String questionText;
    int questionNumber;
    bool isCorrect;
    bool showOverlay = false;

    @override
    void initState() {
        super.initState();

        this.currentQuestion = this.quiz.nextQuestion;
        this.questionText = this.currentQuestion.question;
        this.questionNumber = this.quiz.currentQuestionNumber;
    }

    void handleAnswer(bool answer) {
        this.isCorrect = currentQuestion.answer == answer;
        quiz.answer(this.isCorrect);

        this.setState(() {
            this.showOverlay = true;
        });
    }

    @override
    Widget build(BuildContext context) {
        return new Stack(
            fit: StackFit.expand,
            children: <Widget>[
                new Column( // this is our main page
                    children: <Widget>[
                        new AnswerButton(true, () => this.handleAnswer(true)),
                        new QuestionText(this.questionText, this.questionNumber),
                        new AnswerButton(false, () => this.handleAnswer(false))
                    ],
                ),
                this.showOverlay ? OverlayArt(
                    this.isCorrect,
                    () {
                      if (this.quiz.length == this.questionNumber) {
                        Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new LandingPage()), (Route route) => route == null);
                        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(this.quiz.score, this.quiz.length)));
                        // Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(this.quiz.score, this.quiz.length)), (Route route) => route == null);
                        return;
                      }
                      this.currentQuestion = this.quiz.nextQuestion;
                      this.setState(() {
                          this.questionText = this.currentQuestion.question;
                          this.questionNumber = this.quiz.currentQuestionNumber;
                          this.showOverlay = false;
                      });
                    }) : new Container()
            ],
        );
    }
}