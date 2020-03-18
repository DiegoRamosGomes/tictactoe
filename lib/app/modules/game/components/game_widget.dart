import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tictactoe/app/modules/game/components/position_widget.dart';

class GameWidget extends StatefulWidget {
  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Stack(
        children: <Widget>[
          SvgPicture.asset(
            'assets/images/game/grid.svg',
            width: sizeWidth - 100,
          ),
          PositionWidget(left: 0, top: 0, x: 0, y: 0),
          PositionWidget(left: sizeWidth - 308, top: 0, x: 0, y: 1),
          PositionWidget(left: sizeWidth - 199, top: 0, x: 0, y: 2),
          PositionWidget(left: 0, top: sizeHeight / 7.5, x: 1, y: 0),
          PositionWidget(left: 114, top: sizeHeight / 7.5, x: 1, y: 1),
          PositionWidget(left: 225, top: sizeHeight / 7.5, x: 1, y: 2),
          PositionWidget(left: 0, top: sizeHeight / 3.7, x: 2, y: 0),
          PositionWidget(left: 114, top: sizeHeight / 3.7, x: 2, y: 1),
          PositionWidget(left: 225, top: sizeHeight / 3.7, x: 2, y: 2),
        ],
      ),
    );
  }
}
