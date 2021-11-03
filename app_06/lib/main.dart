import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int x = 0;

  // ignore: non_constant_identifier_names
  Call(String a) {
    setState(() {
      if (a == '+')
        x++;
      else
        x--;
      if (x < 0) x = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _Title(),
      backgroundColor: Colors.red[100],
      body: _Body(),
    );
  }

// ignore: non_constant_identifier_names
  _Title() {
    return AppBar(
      title: Text(
        'Quantas pessoas tem aqui na loja?',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w900, fontSize: 20),
      ),
      centerTitle: true,
      backgroundColor: Colors.deepPurple[300],
    );
  }

// ignore: non_constant_identifier_names
  _Body() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Container(
              width: 360,
              height: 515,
              child: _Count(),
            ),
          ),
        ],
      ),
    );
  }

// ignore: non_constant_identifier_names
  _Count() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('$x', style: TextStyle(color: Colors.black, fontSize: 100)),
        _ButtonsType()
      ],
    );
  }

// ignore: non_constant_identifier_names
  _ButtonsType() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _Buttons('+', Colors.green),
          _Buttons('-', Colors.red)
        ]);
  }

  // ignore: non_constant_identifier_names
  _Buttons(String action, colored) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: Container(
            width: 80,
            height: 80,
            // ignore: deprecated_member_use
            child: RaisedButton(
              onPressed: () => Call(action),
              child: Text(action,
                  style: TextStyle(color: Colors.white, fontSize: 50)),
              color: colored,
            )));
  }
}
