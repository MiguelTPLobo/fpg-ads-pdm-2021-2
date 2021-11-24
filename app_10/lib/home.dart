import 'package:flutter/material.dart';

class WidgetHome extends StatefulWidget {
  const WidgetHome({Key? key}) : super(key: key);

  @override
  _WidgetHomeState createState() => _WidgetHomeState();
}

class _WidgetHomeState extends State<WidgetHome> {
  TextEditingController name = new TextEditingController();
  TextEditingController age = new TextEditingController();
  String sexo = 'Sexo';
  String school = 'Escolaridade';
  double slide = 2000;
  bool swii = false;
  bool confirmed = true;

  String saved_name = '';
  String saved_age = '';
  String saved_sex = '';
  String saved_school = '';
  String saved_limit = '';
  String origin = '';

  void confirm() {
    setState(() {
      confirmed = !confirmed;
      saved_name = 'Nome: ${(name.text)}';
      saved_age = 'Idade: ${(age.text)}';
      if (sexo != 'Sexo')
        saved_sex = 'Sexo: $sexo';
      else {
        saved_sex = 'Sexo: Não Informado';
      }
      if (school != 'Escolaridade')
        saved_school = 'Escolaridade: $school';
      else {
        saved_school = 'Escolaridade: Não Informada';
      }
      saved_limit = 'Limite: ${slide.toString()}';
      if (swii = true)
        origin = 'Nacionalidade: Brasileiro';
      else {
        origin = 'Nacionalidade: Estrangeiro';
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
      title: Text(
        "Cadastro de Conta",
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }

  _body() {
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                _padding(_textfield(TextInputType.name, "Nome:", 20, name), 10,
                    10, 10, 10),
                _padding(_textfield(TextInputType.number, "Idade:", 20, age),
                    10, 0, 10, 0),
                Row(
                  children: <Widget>[
                    _padding(_dropdown(), 20, 10, 10, 0),
                    _padding(_dropdownEsc(), 10, 10, 0, 0),
                  ],
                ),
                _padding(_text('Limite', 20, Colors.green), 0, 20, 240, 0),
                _padding(_slider(), 0, 0, 0, 0),
                Row(children: <Widget>[
                  _padding(_text('Brasileiro', 20, Colors.green), 20, 0, 0, 0),
                  switchy(),
                ]),
                _button(),
                _animatedContainer(),
              ],
            ),
          ),
        ));
  }

  _padding(context, double left, double top, double right, double bottom) {
    return Container(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: context,
    );
  }

  _text(String content, double size, color) {
    return Text(
      content,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }

  _textfield(TextInputType input, String text, double FontSize,
      TextEditingController controll) {
    return TextField(
      keyboardType: input,
      controller: controll,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(fontSize: FontSize, color: Colors.green),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    );
  }

  _dropdown() {
    return DropdownButton<String>(
      value: sexo,
      iconSize: 30,
      elevation: 4,
      style: TextStyle(fontSize: 20, color: Colors.green),
      underline: Container(
        height: 2,
        color: Colors.green,
      ),
      onChanged: (String? newValue) {
        setState(() {
          sexo = newValue!;
        });
      },
      items: <String>['Sexo', 'Masculino', 'Feminino']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  _dropdownEsc() {
    return DropdownButton<String>(
      value: school,
      iconSize: 30,
      elevation: 4,
      style: const TextStyle(fontSize: 20, color: Colors.green),
      underline: Container(
        height: 2,
        color: Colors.green,
      ),
      onChanged: (String? newValue) {
        setState(() {
          school = newValue!;
        });
      },
      items: <String>[
        'Escolaridade',
        'Ensino Médio',
        'Curso Superior',
        'Pós Graduado'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  _slider() {
    return Slider(
      value: slide,
      min: 0,
      max: 5000,
      divisions: 1000,
      label: slide.round().toString(),
      activeColor: Colors.green,
      onChanged: (double value) {
        setState(() {
          slide = value;
        });
      },
    );
  }

  switchy() {
    return Switch(
      value: swii,
      activeTrackColor: Colors.green,
      activeColor: Colors.white,
      onChanged: (value) {
        setState(() {
          swii = value;
        });
      },
    );
  }

  _button() {
    return ElevatedButton(
        onPressed: confirm,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green)),
        child: _text('Confirmar', 20, Colors.white));
  }

  _animatedContainer() {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      width: confirmed ? 0.0 : 320.0,
      height: confirmed ? 0.0 : 210.0,
      color: confirmed ? Colors.white : Colors.green,
      alignment: Alignment.center,
      curve: Curves.fastLinearToSlowEaseIn,
      child: Column(children: <Widget>[
        Align(
            alignment: Alignment.topCenter,
            child: _text('Conta Cadastrada', 25, Colors.white)),
        _padding(_align(_text(saved_name, 20, Colors.white)), 10, 10, 0, 0),
        _padding(_align(_text(saved_age, 20, Colors.white)), 10, 5, 0, 0),
        _padding(_align(_text(saved_sex, 20, Colors.white)), 10, 5, 0, 0),
        _padding(_align(_text(saved_school, 20, Colors.white)), 10, 5, 0, 0),
        _padding(_align(_text(saved_limit, 20, Colors.white)), 10, 5, 0, 0),
        _padding(_align(_text(origin, 20, Colors.white)), 10, 5, 0, 0),
      ]),
    );
  }

  _align(context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: context,
    );
  }
}
