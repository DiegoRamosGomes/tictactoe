import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tictactoe/app/utils/constants.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _button(String text, Function onPressed) {
    return ButtonTheme(
      buttonColor: PRIMARY_COLOR,
      minWidth: MediaQuery.of(context).size.width - 30,
      child: RaisedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: SvgPicture.asset(
                'assets/images/home_logo.svg',
                width: MediaQuery.of(context).size.width - 180,
              ),
            ),
            SizedBox(height: 40),
            _button("MULTIPLAYER", () {
              Modular.to.pushNamed('/multiplayer');
            }),
            SizedBox(height: 20),
            _button("ONE PLAYER", () {}),
            SizedBox(height: 20),
            _button("SETTINGS", () {}),
          ],
        ),
      ),
    );
  }
}
