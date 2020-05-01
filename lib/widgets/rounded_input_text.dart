import 'package:flutter/material.dart';

class RoundedInputText extends StatelessWidget {
  RoundedInputText({@required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.grey[700],
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
      textInputAction: TextInputAction.done,
      autocorrect: true,
      enableInteractiveSelection: true,
      enableSuggestions: true,
      style: TextStyle(
        color: Colors.black87,
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.tag_faces,
          color: Colors.grey[700],
        ),
        hintText: 'Type a message',
        contentPadding: EdgeInsets.all(15.0),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}
