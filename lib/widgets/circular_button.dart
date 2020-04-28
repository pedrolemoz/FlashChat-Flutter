import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
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
