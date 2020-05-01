import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/widgets/chat_bubble_receiver.dart';
import 'package:flash_chat/widgets/chat_bubble_sender.dart';
import 'package:flash_chat/widgets/circular_button.dart';
import 'package:flash_chat/widgets/rounded_input_text.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ntp/ntp.dart';

class ChatScreen extends StatefulWidget {
  static const id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final _firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedUser;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  void dispose() {
    super.dispose();
    _auth.signOut();
  }

  void getUserData() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedUser = user;
      }
    } catch (exception) {
      print(exception);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(title: Text('Flash Chat')),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('messages')
                  .orderBy('datetime')
                  .snapshots(),
              builder: (context, snapshot) {
                List<Widget> messagesWidgets = [];
                if (snapshot.hasData) {
                  final messages = snapshot.data.documents.reversed;

                  for (var message in messages) {
                    final messageText = message.data['text'];
                    final currentTime = message.data['currentTime'];
                    final messageSender = message.data['sender'];

                    final messageWidget = messageSender == loggedUser.email
                        ? ChatBubbleSender(
                            message: messageText,
                            time: currentTime,
                          )
                        : ChatBubbleReceiver(
                            message: messageText,
                            time: currentTime,
                          );

                    messagesWidgets.add(messageWidget);
                  }
                }
                return Expanded(
                  child: ListView(
                    reverse: true,
                    children: messagesWidgets,
                  ),
                );
              },
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: RoundedInputText(
                    controller: _messageController,
                  ),
                ),
                SizedBox(width: 5.0),
                Expanded(
                  flex: 1,
                  child: CircularButton(
                    onPressed: () async {
                      // Datetime delay fixed with NTP
                      DateTime dateTime = DateTime.now().toLocal();
                      int offset = await NTP.getNtpOffset(localTime: dateTime);
                      dateTime.add(Duration(milliseconds: offset));

                      _firestore.collection('messages').add({
                        'text': _messageController.text,
                        'sender': loggedUser.email,
                        'datetime': dateTime.toUtc(),
                        'currentTime': [
                          dateTime.hour,
                          dateTime.minute,
                          dateTime.second
                        ],
                      });
                      _messageController.clear();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
