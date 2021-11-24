import 'package:flutter/material.dart';

class WidgetHome extends StatefulWidget {
  const WidgetHome({Key? key}) : super(key: key);

  @override
  _WidgetHomeState createState() => _WidgetHomeState();
}

class _WidgetHomeState extends State<WidgetHome> {
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
    return ListView(children: <Widget>[
      _p(_c(_col('Desenvolvedor Backend', 0, 10, 20, 0)), 20, 15, 20, 15),
      _p(_c(_col('Engenheiro de Dados', 0, 10, 50, 0)), 20, 15, 20, 15),
      _p(_c(_col('Professor', 0, 10, 175, 0)), 20, 15, 20, 15),
      _p(_c(_col('Especialista de TI', 0, 10, 90, 0)), 20, 15, 20, 15),
      _p(_c(_col('', 0, 10, 90, 0)), 20, 15, 20, 15),
    ]);
  }

  _p(context, double L, double T, double R, double B) {
    return Padding(
      padding: EdgeInsets.fromLTRB(L, T, R, B),
      child: context,
    );
  }

  _c(context) {
    return Container(
      height: 165,
      color: Colors.white,
      child: context,
    );
  }

  _t(text, double size, color) {
    return Text(text, style: TextStyle(fontSize: size, color: color));
  }

  _col(name, double L, double T, double R, double B) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: <
        Widget>[
      _p(_t(name, 25, Colors.teal), L, T, R, B),
      _p(_t('Salário: R\$ _____.__', 20, Colors.black), 0, 5, 115, 0),
      _p(_t('Descrição:---------------------------------', 20, Colors.green), 5,
          5, 10, 0),
      _p(
          _t('-------------------------------------------------', 20,
              Colors.black),
          5,
          5,
          10,
          0),
      _p(_t('Contato: (XX) XXXXX-XXXX', 20, Colors.green), 0, 5, 35, 0),
    ]);
  }
}
