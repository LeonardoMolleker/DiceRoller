import 'package:dice_roller/classes/dice.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';

class DicePage extends StatelessWidget{
  final diceQuantity = 6;
  final String path = "lib/assets/face";
  final String ext = ".png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice page"),
      ),
      body: GridView.count(
        padding: EdgeInsets.only(top: 7.0),
        childAspectRatio: 1.17,
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
              height: 45.0,
              padding: EdgeInsets.only(right: 5.0, top: 10.0),
              child: Text(
                "Press any dice to roll them!",
                style: TextStyle(fontSize: 27.0),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                "Score: 21",
                style: TextStyle(fontSize: 25.0),
              ),
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
        getFace(i)
      );
    }
    return dices;
  }

  Widget getFace(int diceValue){
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Image.asset(
        path + diceValue.toString() + ext,
        scale: 0.8,
      ),
    );
  }

}