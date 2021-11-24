import 'package:flutter/material.dart';

class Okuyasu extends StatelessWidget {
  const Okuyasu({Key? key}) : super(key: key);

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
                    'https://static.jojowiki.com/images/3/3b/latest/20210107171500/Okuyasu_Nijimura_Infobox_Manga.png'))));
  }
}
