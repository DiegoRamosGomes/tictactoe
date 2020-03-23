import 'package:tictactoe/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tictactoe/app/modules/home/home_page.dart';
import 'package:tictactoe/app/modules/home/form_controller.dart';
import 'package:tictactoe/app/modules/home/multiplayer/form/form_multiplayer_page.dart';
import 'package:tictactoe/app/modules/home/one_player/form/form_oneplayer_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => FormController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
        Router('/multiplayer', child: (_, args) => FormMultiplayerPage()),
        Router('/one-player', child: (_, args) => FormOnePlayerPage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
