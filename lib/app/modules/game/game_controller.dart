import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tictactoe/app/utils/constants.dart';

part 'game_controller.g.dart';

class GameController = _GameBase with _$GameController;

abstract class _GameBase with Store {
  @observable
  List<List<int>> _gameMatrix;

  @observable
  int turn = PLAYER_NONE;

  int winPlayer;

  @observable
  String actualPlayerName = "";

  @action
  setPlayer() {
    if (turn == PLAYER_TWO || turn == PLAYER_AI) {
      turn = PLAYER_ONE;
    } else if (turn == PLAYER_ONE) {
      turn = PLAYER_TWO;
    }
  }

  initGame() {
    _gameMatrix = List(3);
    for (var i = 0; i < _gameMatrix.length; i++) {
      _gameMatrix[i] = List(3);
      for (var j = 0; j < _gameMatrix[i].length; j++) {
        _gameMatrix[i][j] = PLAYER_NONE;
      }
    }
  }

  isPlayable(int x, int y) => _gameMatrix[x][y] == PLAYER_NONE;

  occupePosition(int x, int y) {
    _gameMatrix[x][y] = turn;
    if (isGameOver(x, y)) {
      winPlayer = turn;
      Modular.to.pushReplacementNamed('/game/win');
    }
  }

  // 8 = row1, row2, row3, col1, col2, col3, diag1, diag2
  List gameState = List.filled(8, 0);
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

  @action
  getTurnObject() {
    if (this.turn == PLAYER_NONE)
      return null;
    else if (this.turn == PLAYER_ONE)
      return 'assets/images/game/X.svg';
    else
      return 'assets/images/game/O.svg';
  }

  String icon(int x, int y) {
    if (_gameMatrix[x][y] == PLAYER_ONE) return "assets/images/game/X.svg";
    return "assets/images/game/O.svg";
  }
}
