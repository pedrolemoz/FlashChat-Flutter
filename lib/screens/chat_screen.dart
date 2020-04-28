import 'package:flash_chat/widgets/chat_bubble_receiver.dart';
import 'package:flash_chat/widgets/chat_bubble_sender.dart';
import 'package:flash_chat/widgets/circular_button.dart';
import 'package:flash_chat/widgets/rounded_input_text.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static const id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(title: Text('Flash Chat')),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            ChatBubbleSender(message: 'This is a message'),
            ChatBubbleReceiver(message: 'This is another message'),
            ChatBubbleSender(message: 'Eh mole não'),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Expanded(flex: 6, child: RoundedInputText()),
                Expanded(flex: 1, child: CircularButton()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
