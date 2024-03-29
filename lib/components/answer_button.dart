import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
    final bool _answer;
    final VoidCallback _onTap;

    AnswerButton(this._answer, this._onTap);

    @override
    Widget build(BuildContext context) {
        return new Expanded( // true button
            child: new Material(
                color: this._answer ? Colors.greenAccent : Colors.redAccent,
                child: new InkWell(
                    onTap: () => this._onTap(),
                    child: new Center(
                        child: new Container(
                            decoration: new BoxDecoration(
                                border: new Border.all(
                                    color: Colors.white,
                                    width: 5.0
                                )
                            ),
                            padding: new EdgeInsets.all(20.0),
                            child: new Text(this._answer ? 'True' : 'False', style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35.0),),
                        ),
                    ),
                )
            ),
        );
    }
}
