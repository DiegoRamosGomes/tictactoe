import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tictactoe/app/utils/constants.dart';

class FormPage extends StatefulWidget {
  final String title;
  const FormPage({Key key, this.title = "MULTIPLAYER"}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  _input(String text, String hintText, Function onChange) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 5),
          Container(
            height: 50,
            color: Color.fromRGBO(219, 215, 239, 1),
            child: TextField(
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(color: Color.fromRGBO(147, 138, 184, 1)),
                  contentPadding:
                      EdgeInsets.only(top: 15, bottom: 15, left: 15)),
              onChanged: onChange,
            ),
          )
        ],
      ),
    );
  }

  _button(String text, Function onPressed) {
    return ButtonTheme(
      buttonColor: PRIMARY_COLOR,
      minWidth: MediaQuery.of(context).size.width - 60,
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
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              widget.title,
              style: TextStyle(color: PRIMARY_COLOR),
            ),
            centerTitle: true,
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios, color: PRIMARY_COLOR),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _input('Player one', 'Name of player one', (String value) {}),
              SizedBox(height: 15),
              _input('Player two', 'Name of player two', (String value) {}),
              SizedBox(height: 30),
              _button('START GAME', () {
                Modular.to.pushReplacementNamed('/game');
              })
            ],
          ),
        )
      ],
    );
  }
}
