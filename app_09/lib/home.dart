import 'package:flutter/material.dart';
import 'dart:math';

class WidgetHome extends StatefulWidget {
  const WidgetHome({Key? key}) : super(key: key);

  @override
  _WidgetHomeState createState() => _WidgetHomeState();
}

class _WidgetHomeState extends State<WidgetHome> {
  String resultInfo = " ";

  void _diceRoll() {
    setState(() {
      final numero = new Random().nextInt(11);

      resultInfo = "O Numero secreto é: $numero";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _title(),
      backgroundColor: Colors.black,
      body: _body(),
    );
  }

  _title() {
    return AppBar(
      title: Text("Pense em um numero de 0 a 10"),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }

  _body() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _image(),
          _text(resultInfo),
          _button(),
        ],
      ),
    );
  }

  _button() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _diceRoll,
          child: Text("Descobrir",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Colors.green,
        ),
      ),
    );
  }

  _text(textToShow) {
    return Text(
      textToShow,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.red, fontSize: 25.0),
    );
  }

  _image() {
    return Image.network(
        'https://st2.depositphotos.com/2731675/6318/i/600/depositphotos_63189647-stock-photo-head-with-interrogation.jpg',
        height: 230,
        fit: BoxFit.cover);
  }
}
