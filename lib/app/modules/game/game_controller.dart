import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tictactoe/app/modules/home/form_controller.dart';
import 'package:tictactoe/app/utils/constants.dart';

part 'game_controller.g.dart';

class GameController = _GameBase with _$GameController;

abstract class _GameBase with Store {
  @observable
  List<List<int>> _gameMatrix;

  @observable
  int turn = PLAYER_NONE;

  @observable
  String actualPlayerName = '';

  FormController formController = Modular.get<FormController>();

  int winPlayer;

  // 8 = row1, row2, row3, col1, col2, col3, diag1, diag2
  List gameState = List.filled(8, 0);

  @action
  setPlayer(x, y) {
    print('a1');
    if (isPlayable(x, y)) {
      print('a2');
      occupePosition(x, y);
      if (turn == PLAYER_ONE) {
        print('if');
        turn = PLAYER_TWO;
        actualPlayerName = formController.playerTwoName;
        setPlayer(2, 2);
      } else {
        print('else');
        turn = PLAYER_ONE;
        actualPlayerName = formController.playerOneName;
        // occupePosition(2, 2);
      }
    }
  }

  initGame() {
    print(turn);
    if (formController.playerOneName.isEmpty &&
        formController.playerTwoName.isEmpty) {
      formController.playerOneName = 'Player One';
      formController.playerTwoName = 'AI';
    }
    winPlayer = null;
    actualPlayerName = formController.playerOneName;
    gameState = List.filled(8, 0);
    turn = PLAYER_ONE;
    _gameMatrix = List(3);
    for (int i = 0; i < _gameMatrix.length; i++) {
      _gameMatrix[i] = List(3);
      for (int j = 0; j < _gameMatrix[i].length; j++) {
        _gameMatrix[i][j] = PLAYER_NONE;
      }
    }
  }

  @action
  String icon(int x, int y) => _gameMatrix[x][y] == PLAYER_ONE
      ? "assets/images/game/X.svg"
      : "assets/images/game/O.svg";

  String getWinPlayerName() => winPlayer == PLAYER_ONE
      ? formController.playerOneName
      : formController.playerTwoName;

  bool isPlayable(int x, int y) => _gameMatrix[x][y] == PLAYER_NONE;

  @action
  occupePosition(int x, int y) {
    _gameMatrix[x][y] = turn;
    if (isGameOver(x, y)) {
      winPlayer = turn;
      Modular.to.pushReplacementNamed('/game/win');
    }
  }

  isGameOver(int x, int y) {
    int point = turn == PLAYER_ONE ? 1 : -1;

    //soma os valores na linha e coluna
    gameState[x] += point;
    gameState[3 + y] += point;

    // diagonal 1
    if (x == y) {
      gameState[6] += point;
    }

    // diagonal 2
    if ((x + 1) + (y + 1) == 4) {
      gameState[7] += point;
    }

    // alguma das possibilidades tem 3 icones iguais
    int i = gameState.indexOf(3);
    int j = gameState.indexOf(-3);
    return (i >= 0 || j >= 0);
  }
}
