import 'package:mobx/mobx.dart';

part 'form_controller.g.dart';

class FormController = _FormBase with _$FormController;

abstract class _FormBase with Store {
  @observable
  String playerOneName = "";

  @observable
  String playerTwoName = "";


}
