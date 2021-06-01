import 'package:dice_roller/classes/dice.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';

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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 2.0, color: Colors.blue)
          )
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 55.0,
              padding: EdgeInsets.only(right: 5.0, top: 10.0),
              child: Text(
                "Press any dice to roll them!",
                style: TextStyle(fontSize: 30.0),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              "Score: 21",
              style: TextStyle(fontSize: 30.0),
            )
          ],
        ),
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