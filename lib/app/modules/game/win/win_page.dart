import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tictactoe/app/modules/game/game_controller.dart';
import 'package:tictactoe/app/utils/constants.dart';

class WinPage extends StatefulWidget {
  final String title;
  const WinPage({Key key, this.title = "Win"}) : super(key: key);

  @override
  _WinPageState createState() => _WinPageState();
}

class _WinPageState extends State<WinPage> {
  GameController controller = Modular.get<GameController>();

  _button(String text, String routeName) {
    return ButtonTheme(
      buttonColor: PRIMARY_COLOR,
      minWidth: MediaQuery.of(context).size.width / 2,
      child: RaisedButton(
        onPressed: () {
          Modular.to.pushReplacementNamed(routeName);
        },
        child: Text(text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        padding: EdgeInsets.symmetric(vertical: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              leading: new IconButton(
                icon: new Icon(Icons.arrow_back_ios, color: PRIMARY_COLOR),
                onPressed: () => Navigator.of(context).pop(),
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text("End Game", style: TextStyle(color: PRIMARY_COLOR))),
          body: Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Player ${controller.getWinPlayerName()} wins",
                  style: TextStyle(fontSize: 26, color: PRIMARY_COLOR),
                ),
                SizedBox(
                  height: 30,
                ),
                _button("Home", "/"),
                SizedBox(
                  height: 30,
                ),
                _button("Play Again", "/game"),
              ],
            ),
          ),
        )
      ],
    );
  }
}
