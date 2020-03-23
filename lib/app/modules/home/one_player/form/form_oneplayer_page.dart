import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tictactoe/app/modules/home/form_controller.dart';
import 'package:tictactoe/app/utils/constants.dart';

class FormOnePlayerPage extends StatefulWidget {
  final String title;
  const FormOnePlayerPage({Key key, this.title = "Form"}) : super(key: key);

  @override
  _FormOnePlayerPageState createState() => _FormOnePlayerPageState();
}

class _FormOnePlayerPageState extends State<FormOnePlayerPage> {

  FormController controller = Modular.get<FormController>();

  _button(String text, Color color, Function onPressed) {
    return ButtonTheme(
      buttonColor: color,
      minWidth: MediaQuery.of(context).size.width - 30,
      child: RaisedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            title: Text(
              "turn".toUpperCase(),
              style: TextStyle(color: PRIMARY_COLOR),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _button("Easy".toUpperCase(), PRIMARY_COLOR, () {
                  controller.startOnePlayer(GAME_LEVEL_EASY);
                }),
                SizedBox(height: 20,),
                _button("Medium".toUpperCase(), PRIMARY_COLOR, () {
                  controller.startOnePlayer(GAME_LEVEL_MEDIUM);
                }),
                SizedBox(height: 20,),
                _button("Hard".toUpperCase(), PRIMARY_COLOR, () {
                  controller.startOnePlayer(GAME_LEVEL_HARD);
                }),
                SizedBox(height: 20,),
                _button("Insane".toUpperCase(), Colors.redAccent, () {
                  controller.startOnePlayer(GAME_LEVEL_INSANE);
                }),
              ],
            ),
          ),
        )
      ],
    );
  }
}
