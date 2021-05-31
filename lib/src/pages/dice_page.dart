import 'package:dice_roller/classes/dice.dart';
import "package:flutter/material.dart";

class DicePage extends StatelessWidget{
  final diceQuantity = 6;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice page"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 20.0,
        children: getDices(diceQuantity),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("Roll"),
        onPressed: () {},
      ),
    );
  }

  getDices(int diceQuantity) {
    List<Widget> dices = [];
    for(var i = 1; i<=diceQuantity; i++){
      dices.add(
        Dice.getFace(i)
      );
    }
    return dices;
  }

}