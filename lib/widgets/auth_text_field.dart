import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField(
      {@required this.controller,
      @required this.keyboardType,
      @required this.isPassword,
      @required this.hintText});

  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enableSuggestions: true,
      enableInteractiveSelection: true,
      textAlign: TextAlign.center,
      showCursor: false,
      keyboardType: keyboardType,
      style: kLabelTextStyle,
      obscureText: isPassword,
      decoration: kInputDecoration.copyWith(hintText: hintText),
    );
  }
}
