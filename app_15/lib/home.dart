import 'package:flutter/material.dart';
import 'jojo.dart';
import 'okuyasu.dart';
import 'koichi.dart';
import 'polnareff.dart';
import 'abbacchio.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int current = 0;

  // ignore: non_constant_identifier_names
  final tab_list = [
    Jojo(),
    Okuyasu(),
    Koichi(),
    Polnareff(),
    Abbacchio(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title(),
      body: tab_list[current],
      backgroundColor: Colors.black,
      drawer: drawer(),
    );
  }

  title() {
    return AppBar(
      title: Text("JoJo Bizzare Drawerventures"),
      backgroundColor: Colors.green,
    );
  }

  drawer() {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.green),
      child: Drawer(
          child: ListView(
        children: [
          circle(),
          list('Home', 'First', Icons.backpack, 0),
          list('Okuyasu', 'Second', Icons.backpack, 1),
          list('Koichi', 'Third', Icons.backpack, 2),
          list('Polnareff', 'Fourth', Icons.backpack, 3),
          list('Abbacchio', 'fifth', Icons.backpack, 4)
        ],
      )),
    );
  }

  circle() {
    return Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.scaleDown,
                image: NetworkImage(
                    'https://static.wikia.nocookie.net/jjba/images/d/d5/Jojo%27s_Bizarre_Adventure_%28Classic_English_Logo_Vector%29.png/revision/latest?cb=20191028000323'))));
  }

  list(title, sub, icon, c) {
    return ListTile(
      title: Text(title),
      subtitle: Text(sub),
      trailing: Icon(icon),
      onTap: () {
        setState(() {
          Navigator.pop(context);
          current = c;
        });
      },
    );
  }
}
