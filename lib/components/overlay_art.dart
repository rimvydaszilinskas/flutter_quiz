import 'dart:math';
import 'package:flutter/material.dart';

class OverlayArt extends StatefulWidget {
  final bool _isCorrect;
  final VoidCallback _onTap;

  OverlayArt(this._isCorrect, this._onTap);

  @override
  State createState() => new OverlayArtState();
}

class OverlayArtState extends State<OverlayArt> with SingleTickerProviderStateMixin {

  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();

    this._iconAnimationController = new AnimationController(duration: new Duration(seconds: 1), vsync: this);
    this._iconAnimation = new CurvedAnimation(parent: this._iconAnimationController, curve: Curves.elasticOut);
    this._iconAnimation.addListener(() => this.setState(() {}));

    this._iconAnimationController.forward();
  }

  @override
  void dispose() {
    this._iconAnimationController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) { 
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => this.widget._onTap(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: new Border.all(
                  color: Colors.white,
                  width: 6.0
                )
              ),
              child: new Transform.rotate(
                child: new Icon(widget._isCorrect ? Icons.done : Icons.clear, size: this._iconAnimation.value * 80.0, color: Colors.white,),
                angle: this._iconAnimation.value * 2 * pi,
              )
            ),
            new Padding(
              padding: new EdgeInsets.only(bottom: 20.0),
            ),
            new Text(widget._isCorrect ? 'Correct!' : 'Wrong!', style: new TextStyle(color: Colors.white, fontSize: 30.0),)
          ],
        ),
      ),
    );
  }
}