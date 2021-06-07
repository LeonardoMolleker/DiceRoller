import '../bloc/i_dice_bloc.dart';
import '../const/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  final IDiceBloc diceBloc;
  final String path;
  final String ext;
  final int value;

  Dice(
    this.diceBloc,
    this.path,
    this.ext,
    this.value,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: diceBloc.rollDices,
      child: Padding(
        padding: const EdgeInsets.only(
          left: Constants.containerPadding,
          right: Constants.containerPadding,
        ),
        child: Container(
          child: Image.asset(
            path + value.toString() + ext,
          ),
        ),
      ),
    );
  }
}
