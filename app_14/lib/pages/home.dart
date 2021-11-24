import 'dart:html';

import 'package:app_14/pages/data.dart';
import 'package:app_14/utils/accoount.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetHome extends StatefulWidget {
  const WidgetHome({Key? key}) : super(key: key);

  @override
  _WidgetHomeState createState() => _WidgetHomeState();
}

class _WidgetHomeState extends State<WidgetHome> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  String? sexo = "Masculino";
  String? escolaridade = "Fundamental";
  bool isBrasileiro = false;
  double limit = 0.0;

  void _goToData(BuildContext context) {
    Account conta = new Account(name.text, int.parse(age.text), sexo.toString(),
        escolaridade.toString(), isBrasileiro, limit);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return Data(conta: conta);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Abertura de Conta"),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.white,
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 15, left: 10, bottom: 15, right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _inputText('Nome', name),
            _inputText('Idade', age),
            _dropdownSexo(),
            _dropdownEscolaridade(),
            _switch(),
            _slider(),
            RaisedButton(
              color: Colors.green,
              onPressed: () {
                _goToData(context);
              },
              child: Text("Confirmar",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              padding:
                  EdgeInsets.only(top: 15, left: 20, bottom: 15, right: 20),
            ),
          ],
        ));
  }

  _inputText(label, controller) {
    return TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.black87,
          ),
        ),
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.black87, fontSize: 20),
        controller: controller);
  }

  _dropdownSexo() {
    return DropdownButton<String>(
      isExpanded: true,
      value: sexo,
      items: <String>["Masculino", "Feminino", "Prefiro não informar"]
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      onChanged: (String? valorSelecionado) {
        setState(() {
          sexo = valorSelecionado;
        });
      },
    );
  }

  _dropdownEscolaridade() {
    return DropdownButton<String>(
      isExpanded: true,
      value: escolaridade,
      items: <String>["Fundamental", "Graduação", "Pós Graduação"]
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      onChanged: (String? valorSelecionado) {
        setState(() {
          escolaridade = valorSelecionado;
        });
      },
    );
  }

  _switch() {
    return Container(
        child: Row(
      children: [
        Text("Brasileiro:", style: TextStyle(fontSize: 20)),
        Switch(
          value: isBrasileiro,
          onChanged: (value) {
            setState(() {
              isBrasileiro = value;
            });
          },
          activeTrackColor: Colors.lightGreenAccent,
          activeColor: Colors.blue,
        )
      ],
    ));
  }

  _slider() {
    return Container(
        child: Row(
      children: [
        Text("Limite", style: TextStyle(fontSize: 20)),
        Slider(
          value: limit,
          min: 0,
          max: 100,
          divisions: 100,
          label: limit.round().toString(),
          onChanged: (double value) {
            setState(() {
              limit = value;
            });
          },
        )
      ],
    ));
  }
}
