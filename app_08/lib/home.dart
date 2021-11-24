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

      double result = n2 / (n1 * n1);
      if (result < 18.5) {
        resultInfo = "Abaixo do Peso";
      } else if (result >= 18.5 && result <= 24.9) {
        resultInfo = "Peso Normal:$result";
      } else if (result >= 25 && result <= 29.9) {
        resultInfo = "Sobrepeso";
      } else if (result >= 30 && result <= 34.9) {
        resultInfo = "Obesidade Grau 1";
      } else if (result >= 35 && result <= 39.9) {
        resultInfo = "Obesidade Grau 2";
      } else {
        resultInfo = "Obesidade Grau 3 ou Mórbida";
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
      title: Text("Cálculo do IMC"),
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
          _input("Altura: ", n1Controller),
          _input("Peso: ", n2Controller),
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

  _image() {
    return Image.network(
        'https://perdendobarriga.com.br/wp-content/uploads/2017/04/imc.jpg',
        height: 230,
        fit: BoxFit.cover);
  }
}
