import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
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
                controller: _emailController,
                enableSuggestions: true,
                enableInteractiveSelection: true,
                textAlign: TextAlign.center,
                showCursor: false,
                keyboardType: TextInputType.emailAddress,
                style: kLabelTextStyle,
                decoration: kInputDecoration.copyWith(hintText: 'Email'),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: _passwordController,
                enableSuggestions: true,
                enableInteractiveSelection: true,
                textAlign: TextAlign.center,
                showCursor: false,
                keyboardType: TextInputType.visiblePassword,
                style: kLabelTextStyle,
                obscureText: true,
                decoration: kInputDecoration.copyWith(hintText: 'Password'),
              ),
              SizedBox(height: 10.0),
              Hero(
                tag: 'loginButton',
                child: RoundedButton(
                  label: 'Login',
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text);
                      if (user != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (exception) {
                      print(exception);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
