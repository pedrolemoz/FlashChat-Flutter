import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class ErrorAlertDialog extends StatelessWidget {
  ErrorAlertDialog({@required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Something went wrong'),
      titleTextStyle: kLabelTextStyle.copyWith(fontSize: 24.0),
      content: Text(description),
      elevation: 15.0,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide.none,
      ),
      actions: <Widget>[
        Container(
          width: 120.0,
          margin: EdgeInsets.only(right: 15.0, bottom: 10.0),
          child: RaisedButton(
            color: Colors.lightBlueAccent,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Try again',
              style: kLabelTextStyle.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
