import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  CircularButton({@required this.onPressed});

  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      elevation: 0.0,
      color: Theme.of(context).primaryColor,
      child: Icon(
        Icons.send,
        color: Colors.white,
        size: 30.0,
      ),
      padding: EdgeInsets.all(12.0),
      shape: CircleBorder(),
    );
  }
}
