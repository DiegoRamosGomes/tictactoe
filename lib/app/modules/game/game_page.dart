import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tictactoe/app/modules/game/components/game_widget.dart';
import 'package:tictactoe/app/modules/game/game_controller.dart';
import 'package:tictactoe/app/utils/constants.dart';

class GamePage extends StatefulWidget {
  final String title;
  const GamePage({Key key, this.title = "Game"}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  GameController controller = Modular.get<GameController>();

  @override
  Widget build(BuildContext context) {
    controller.initGame();
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
              title: Text("Game", style: TextStyle(color: PRIMARY_COLOR))),
          body: GameWidget(),
        )
      ],
    );
  }
}
