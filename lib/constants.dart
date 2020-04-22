import 'package:flutter/material.dart';

const kWelcomeScreenTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontSize: 50.0,
  fontWeight: FontWeight.w700,
);

const kButtonsTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'OpenSans',
  fontSize: 25.0,
  fontWeight: FontWeight.w700,
);

const kHintTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.w400,
  fontSize: 18.0,
  color: Colors.grey,
);

const kLabelTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.w400,
  fontSize: 18.0,
  color: Colors.black,
);

const kInputDecoration = InputDecoration(
  hintStyle: kHintTextStyle,
  contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
  border:
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.lightBlueAccent,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.lightBlueAccent,
      width: 2.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
);
