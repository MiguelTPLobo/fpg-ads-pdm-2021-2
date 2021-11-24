import 'package:app_14/utils/accoount.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Data extends StatelessWidget {
  Account conta;

  Data({required this.conta});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dados da conta"),
        backgroundColor: Colors.black87,
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
        padding: EdgeInsets.only(top: 15, left: 10, bottom: 15, right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nome: ${conta.name}", style: TextStyle(fontSize: 20)),
            Text("Idade: ${conta.age}", style: TextStyle(fontSize: 20)),
            Text("Sexo: ${conta.sexo}", style: TextStyle(fontSize: 20)),
            Text("Escolaridade: ${conta.escolaridade}",
                style: TextStyle(fontSize: 20)),
            Text("Limite: ${conta.limit}", style: TextStyle(fontSize: 20)),
            Text("Brasileiro: ${conta.isBrasileiro ? "Sim" : "Não"}",
                style: TextStyle(fontSize: 20)),
          ],
        ));
  }
}
