import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/widgets/auth_text_field.dart';
import 'package:flash_chat/widgets/error_alert_dialog.dart';
import 'package:flash_chat/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                  'Create a new account',
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
                tag: 'registerButton',
                child: RoundedButton(
                  label: 'Register',
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );

                      if (newUser != null) {
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
                        case 'ERROR_WEAK_PASSWORD':
                          description = 'Your password is not strong enough';
                          break;
                        case 'ERROR_EMAIL_ALREADY_IN_USE':
                          description = 'This email is already in use';
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
