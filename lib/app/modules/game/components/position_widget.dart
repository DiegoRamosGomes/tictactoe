import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tictactoe/app/modules/game/game_controller.dart';
import 'package:tictactoe/app/utils/constants.dart';

class PositionWidget extends StatefulWidget {
  final double left;
  final double top;
  final int x;
  final int y;

  PositionWidget({this.left, this.top, this.x, this.y});

  @override
  _PositionWidgetState createState() =>
      _PositionWidgetState(left: left, top: top, x: x, y: y);
}

class _PositionWidgetState extends State<PositionWidget> {
  double left;
  double top;
  int x;
  int y;

  _PositionWidgetState({this.left, this.top, this.x, this.y});
  final controller = Modular.get<GameController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          controller.setPlayer(x, y);
        });
        if (controller.formController.gameLevel != GAME_LEVEL_NONE) {
          print("Level: ${controller.formController.gameLevel}");
          print("Player: ${controller.turn}");
          controller.setPlayer(2, 2);
        }
        print(controller.gameState);
      },
      child: Padding(
        padding: EdgeInsets.only(left: left, top: top),
        child: Observer(
          builder: (_) {
            if (controller.isPlayable(x, y)) {
              return Container(
                  width: 100, height: 100, color: Colors.transparent);
            }
            return SvgPicture.asset(controller.icon(x, y), width: 100);
          },
        ),
      ),
    );
  }
}
