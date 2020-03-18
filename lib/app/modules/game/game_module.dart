import 'package:tictactoe/app/modules/game/game_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tictactoe/app/modules/game/game_page.dart';
import 'package:tictactoe/app/modules/game/win/win_page.dart';

class GameModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => GameController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => GamePage()),
        Router('/win', child: (_, args) => WinPage()),
      ];

  static Inject get to => Inject<GameModule>.of();
}
