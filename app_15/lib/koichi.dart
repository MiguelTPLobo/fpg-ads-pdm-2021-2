import 'package:flutter/material.dart';

class Koichi extends StatelessWidget {
  const Koichi({Key? key}) : super(key: key);

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
                    'https://img1.picmix.com/output/stamp/normal/6/1/6/4/1794616_262e7.png'))));
  }
}
