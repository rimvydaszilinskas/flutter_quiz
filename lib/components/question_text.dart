import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {
  final String _question;
  final int _questionNumber;

  QuestionText(this._question, this._questionNumber);

  @override
  State createState() => new QuestionTextState();
}

class QuestionTextState extends State<QuestionText> with SingleTickerProviderStateMixin {

  Animation<double> _fontSizeAnimation;
  AnimationController _fontSizeAnimationController;

  @override
  void initState() {
    super.initState();

    this._fontSizeAnimationController = new AnimationController(
      duration: new Duration(milliseconds: 500),
      vsync: this
    );
    this._fontSizeAnimation = new CurvedAnimation(
      parent: this._fontSizeAnimationController,
      curve: Curves.bounceOut
    );
    this._fontSizeAnimation.addListener(() => this.setState(() {}));
    this._fontSizeAnimationController.forward();
  }

  @override
  void dispose() {
    this._fontSizeAnimationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(QuestionText oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (oldWidget._question != widget._question) {
      this._fontSizeAnimationController.reset();
      this._fontSizeAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.white,
      child: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 20.0),
        child: new Center(
          child: new Text(
            'Statement ' + widget._questionNumber.toString() + ': ' + widget._question,
            style: new TextStyle(fontSize: _fontSizeAnimation.value * 15),
            )
        )
      )
    );
  }
}