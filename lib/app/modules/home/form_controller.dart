import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:tictactoe/app/utils/constants.dart';

part 'form_controller.g.dart';

class FormController = _FormBase with _$FormController;

abstract class _FormBase with Store {
  @observable
  String playerOneName = "";

  @observable
  String playerTwoName = "";

  int gameLevel;

  void startGame() {
    if (playerOneName != '' && playerTwoName != '') {
      gameLevel = GAME_LEVEL_NONE;
      Modular.to.pushReplacementNamed('/game');
    } else {
      Fluttertoast.showToast(
        msg: "The name of both player are required",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        fontSize: 16.0,
      );
    }
  }

  void startOnePlayer(int level) {
    playerOneName = "Player";
    playerTwoName = "AI";
    gameLevel = level;
    Modular.to.pushReplacementNamed('/game');
  }
}
