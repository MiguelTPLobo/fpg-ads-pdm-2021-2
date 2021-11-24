import 'package:flutter/material.dart';

class WidgetHome extends StatefulWidget {
  const WidgetHome({Key? key}) : super(key: key);

  @override
  _WidgetHomeState createState() => _WidgetHomeState();
}

class _WidgetHomeState extends State<WidgetHome> {
  TextEditingController valor = TextEditingController();
  String? valueFrom = "Dólar";
  String? valueTo = "Real";

  String? currency = "";

  double result = 0.0;

  void _setResult() {
    setState(() {
      if (valueFrom == "Dólar") {
        if (valueTo == "Euro") {
          currency = "\$";
          result = double.parse(valor.text) * 0.86;
        } else if (valueTo == "Real") {
          currency = "R\$";
          result = double.parse(valor.text) * 5.42;
        } else {
          currency = "€";
          result = double.parse(valor.text);
        }
      } else if (valueFrom == "Real") {
        if (valueTo == "Euro") {
          currency = "\$";
          result = double.parse(valor.text) * 0.16;
        } else if (valueTo == "Dólar") {
          currency = "\$";
          result = double.parse(valor.text) * 0.18;
        } else {
          currency = "R\$";
          result = double.parse(valor.text);
        }
      } else if (valueFrom == "Euro") {
        if (valueTo == "Real") {
          currency = "R\$";
          result = double.parse(valor.text) * 6.28;
        } else if (valueTo == "Dólar") {
          currency = "\$";
          result = double.parse(valor.text) * 1.16;
        } else {
          currency = "\$";
          result = double.parse(valor.text);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor de Moedas"),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.white,
      body: _body(),
    );
  }

  _body() {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _inputText('Valor', valor),
            _dropdownValueFrom(),
            _dropdownValueTo(),
            RaisedButton(
              color: Colors.green,
              onPressed: this._setResult,
              child: Text("Converter",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              padding:
                  EdgeInsets.only(top: 15, left: 20, bottom: 15, right: 20),
            ),
            _result()
          ],
        ));
  }

  _inputText(label, controller) {
    return TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.redAccent,
          ),
        ),
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.green, fontSize: 20),
        controller: controller);
  }

  _dropdownValueTo() {
    return DropdownButton<String>(
      isExpanded: true,
      value: valueTo,
      items: <String>["Dólar", "Real", "Euro"].map((String value) {
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
          valueTo = valorSelecionado;
        });
      },
    );
  }

  _dropdownValueFrom() {
    return DropdownButton<String>(
      isExpanded: true,
      value: valueFrom,
      items: <String>["Dólar", "Real", "Euro"].map((String value) {
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
          valueFrom = valorSelecionado;
        });
      },
    );
  }

  _result() {
    return Text("Resultado ${currency} ${result.toStringAsPrecision(4)}",
        style: TextStyle(
          fontSize: 20,
        ));
  }
}
