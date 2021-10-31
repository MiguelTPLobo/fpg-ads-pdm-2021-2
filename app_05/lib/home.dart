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

  void _mult() {
    setState(() {
      double n1 = double.parse(n1Controller.text);
      double n2 = double.parse(n2Controller.text);

      double result = n1 * n2;
      resultInfo = "Resultado: $result";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _title(),
      backgroundColor: Colors.red[100],
      body: _body(),
    );
  }

  _title() {
    return AppBar(
      title: Text("Multiplicador"),
      centerTitle: true,
      backgroundColor: Colors.purple,
    );
  }

  _body() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _input("Digite o 1° Número: ", n1Controller),
          _input("Digite o 2° Número: ", n2Controller),
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
        labelStyle: TextStyle(color: Colors.teal[700]),
      ),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.teal[700], fontSize: 25.0),
      controller: objController,
    );
  }

  _button() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _mult,
          child: Text("Calcular",
              style: TextStyle(color: Colors.teal[700], fontSize: 20.0)),
          color: Colors.pink[200],
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
}
