import 'package:first/pages/landing_page.dart';
import 'package:flutter/material.dart';

class ScorePage extends StatelessWidget {
  final int _score;
  final int _totalQuestions;

  ScorePage(this._score, this._totalQuestions);

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blueAccent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('Your score:', style: new TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 50.0
          )),
          new Text(this._score.toString() + '/ ' + this._totalQuestions.toString(), style: new TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 50.0
          )),
          new IconButton(
            icon: new Icon(
              Icons.arrow_right,
            ),
            color: Colors.white,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new LandingPage()), (Route route) => route == null),
            iconSize: 80.0,
          )
        ],
      ),
    );
  }
}