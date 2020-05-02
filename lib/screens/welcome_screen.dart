import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('assets/launcher/foreground.png'),
                    height: animation.value * 140,
                  ),
                ),
                TextLiquidFill(
                  text: 'Flash Chat',
                  textStyle: kWelcomeScreenTextStyle,
                  loadDuration: Duration(milliseconds: 1000),
                  waveColor: Colors.black,
                  boxBackgroundColor: Colors.white,
                  boxHeight: 100,
                  boxWidth: 210,
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Hero(
              tag: 'loginButton',
              child: RoundedButton(
                label: 'Login',
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
              ),
            ),
            SizedBox(height: 10.0),
            Hero(
              tag: 'registerButton',
              child: RoundedButton(
                label: 'Register',
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
