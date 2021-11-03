import 'package:flutter/material.dart';

class WidgetHome extends StatefulWidget {
  const WidgetHome({Key? key}) : super(key: key);

  @override
  _WidgetHomeState createState() => _WidgetHomeState();
}

class _WidgetHomeState extends State<WidgetHome> {
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();

  String resultInfo = " ";

  void _math() {
    setState(() {
      double n1 = double.parse(n1Controller.text);
      double n2 = double.parse(n2Controller.text);

      double result = n2 / n1;
      if (result <= 0.7) {
        resultInfo = "Use Alcool !!!";
      } else {
        resultInfo = "Use Gasolina !!!";
      }
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
      title: Text("Alcool ou Gasolina"),
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
          _input("Preço do litro de Gasolina: ", n1Controller),
          _input("Preço do litro de Alcool: ", n2Controller),
          _button(),
          _text(resultInfo),
        ],
      ),
    );
  }

  _input(labelTitle, objController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelTitle,
        labelStyle: TextStyle(color: Colors.lightGreen),
      ),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.lightGreen, fontSize: 25.0),
      controller: objController,
    );
  }

  _button() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _math,
          child: Text("Calcular",
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

  // ignore: non_constant_identifier_names
  _image() {
    return Image.network(
        'http://www.pordentrodoassuntoiguatemi.com.br/wp-content/uploads/2018/05/maxresdefault.jpg',
        height: 200,
        fit: BoxFit.cover);
  }
}
