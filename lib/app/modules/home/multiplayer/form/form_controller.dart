import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';

part 'form_controller.g.dart';

class FormController = _FormBase with _$FormController;

abstract class _FormBase with Store {
  @observable
  String playerOneName = "";

  @observable
  String playerTwoName = "";

  void startGame() {
    if (playerOneName != '' && playerTwoName != '') {
      Modular.to.pushReplacementNamed('/game');
    } else {
      Fluttertoast.showToast(
        msg: "The nameo of both player are required",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        fontSize: 16.0
    );
    }
  }
}
