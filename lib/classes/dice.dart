import 'package:flutter/cupertino.dart';

class Dice{
  static final String _path = "lib/assets/face";
  static final String _ext = ".png";

  static Widget getFace(int diceValue){
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Image.asset(
        _path + diceValue.toString() + _ext,
        scale: 0.8,
      ),
    );
  }
}