import 'package:flutter/material.dart';

class RoundedInputText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.grey[700],
      keyboardType: TextInputType.text,
      style: TextStyle(
        color: Colors.grey[700],
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
