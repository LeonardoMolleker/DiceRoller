import '../const/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  final Function rollDices;
  final String value;

  Dice(
    this.rollDices,
    this.value,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: rollDices,
      child: Padding(
        padding: const EdgeInsets.only(
          left: Constants.containerPadding,
          right: Constants.containerPadding,
        ),
        child: Container(
          child: Image.asset(
            Constants.defaultImagePath +
                value +
                Constants.defaultImageExtension,
          ),
        ),
      ),
    );
  }
}
