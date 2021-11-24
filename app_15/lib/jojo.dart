import 'package:flutter/material.dart';

class Jojo extends StatelessWidget {
  const Jojo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: 500,
            width: 500,
            child: Image(
                fit: BoxFit.contain,
                image: NetworkImage(
                    'https://static.wikia.nocookie.net/jjba/images/d/d5/Jojo%27s_Bizarre_Adventure_%28Classic_English_Logo_Vector%29.png/revision/latest?cb=20191028000323'))));
  }
}
