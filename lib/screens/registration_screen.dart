import 'package:flash_chat/constants.dart';
import 'package:flash_chat/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            Center(
              child: Text(
                'Create a new account',
                style: kWelcomeScreenTextStyle.copyWith(fontSize: 30.0),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              enableSuggestions: true,
              enableInteractiveSelection: true,
              textAlign: TextAlign.center,
              showCursor: false,
              keyboardType: TextInputType.emailAddress,
              style: kLabelTextStyle,
              decoration: kInputDecoration.copyWith(hintText: 'Email'),
              onChanged: (value) {
                print(value);
              },
            ),
            SizedBox(height: 10.0),
            TextField(
              enableSuggestions: true,
              enableInteractiveSelection: true,
              textAlign: TextAlign.center,
              showCursor: false,
              keyboardType: TextInputType.visiblePassword,
              style: kLabelTextStyle,
              obscureText: true,
              decoration: kInputDecoration.copyWith(hintText: 'Password'),
              onChanged: (value) {
                print(value);
              },
            ),
            SizedBox(height: 10.0),
            Hero(
              tag: 'registerButton',
              child: RoundedButton(
                label: 'Register',
                onPressed: () {
                  print(true);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
