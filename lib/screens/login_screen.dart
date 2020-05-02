import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/widgets/auth_text_field.dart';
import 'package:flash_chat/widgets/error_alert_dialog.dart';
import 'package:flash_chat/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('assets/launcher/foreground.png'),
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Enter your credentials',
                  style: kWelcomeScreenTextStyle.copyWith(fontSize: 25.0),
                ),
              ),
              SizedBox(height: 20.0),
              AuthTextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                isPassword: false,
                hintText: 'E-mail',
              ),
              SizedBox(height: 10.0),
              AuthTextField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                hintText: 'Password',
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
                        password: _passwordController.text,
                      );

                      if (user != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }

                      setState(() {
                        showSpinner = false;
                      });
                    } catch (exception) {
                      setState(() {
                        showSpinner = false;
                      });

                      String description;

                      switch (exception.code) {
                        case 'ERROR_INVALID_EMAIL':
                          description = 'Please check your email';
                          break;
                        case 'ERROR_WRONG_PASSWORD':
                          description = 'Please check your password';
                          break;
                        case 'ERROR_USER_NOT_FOUND':
                          description = 'You user was not found';
                          break;
                        case 'ERROR_USER_DISABLED':
                          description = 'This user was disabled in the server';
                          break;
                        case 'ERROR_TOO_MANY_REQUESTS':
                          description =
                              'You are retrying so much. Take a break';
                          break;
                        case 'ERROR_OPERATION_NOT_ALLOWED':
                          description =
                              'You are not allowed to do this operation';
                          break;
                        default:
                          description = 'We don\'t know what is going on';
                      }

                      showDialog(
                        context: context,
                        builder: (context) {
                          return ErrorAlertDialog(description: description);
                        },
                      );
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
