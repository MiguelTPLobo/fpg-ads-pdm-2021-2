import 'package:flutter/material.dart';

class Abbacchio extends StatelessWidget {
  const Abbacchio({Key? key}) : super(key: key);

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
                    'https://64.media.tumblr.com/e1ded46320c73db12ad2bbc475346957/tumblr_pf41rxcNrS1sh11j9o1_500.png'))));
  }
}
