import 'package:flutter/material.dart';

class Polnareff extends StatelessWidget {
  const Polnareff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
      backgroundColor: Colors.black,
    );
  }

  _body(BuildContext context) {
    return Center(
        child: Container(
            height: 300,
            width: 800,
            child: Image(
                fit: BoxFit.contain,
                image: NetworkImage(
                    'https://static.wikia.nocookie.net/characterprofile/images/3/33/Boneraff.png/revision/latest?cb=20161112222120'))));
  }
}
