import 'package:flash_chat/constants.dart';
import 'package:flash_chat/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                'Enter your credentials',
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
              decoration:
                  kInputDecoration.copyWith(hintText: 'Email'),
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
              obscureText: true,
              decoration:
                  kInputDecoration.copyWith(hintText: 'Password'),
              onChanged: (value) {
                print(value);
              },
            ),
            SizedBox(height: 10.0),
            Hero(
              tag: 'loginButton',
              child: RoundedButton(
                label: 'Login',
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
