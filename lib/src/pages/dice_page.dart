import '../../const/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DicePage extends StatelessWidget {
  String ext;
  String path;
  int diceQuantity;
  int crossAxisCount;

  DicePage({
    this.diceQuantity,
    this.path = "lib/assets/face",
    this.ext = ".png",
    this.crossAxisCount = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dice page",
        ),
      ),
      body: GridView.count(
        padding: EdgeInsets.only(
          top: Constants.gridViewPaddingTop,
        ),
        childAspectRatio: Constants.aspectRatio,
        crossAxisCount: this.crossAxisCount,
        crossAxisSpacing: Constants.gridViewPaddingTop,
        children: List.generate(this.diceQuantity, (index) {
          return Container(
            padding: EdgeInsets.only(
              left: Constants.containerPadding,
              right: Constants.containerPadding,
            ),
            child: Image.asset(
              this.path + (++index).toString() + this.ext,
            ),
          );
        }),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: Constants.borderSideWidth,
              color: Colors.blue,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: Constants.containerHeight,
              padding: EdgeInsets.only(
                right: Constants.containerPaddingRight,
                top: Constants.containerPadding,
              ),
              child: Text(
                "Press any dice to roll them!",
                style: TextStyle(
                  fontSize: Constants.indicatorTextFontSize,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                bottom: Constants.containerPadding,
              ),
              child: Text(
                "Score: 21",
                style: TextStyle(
                  fontSize: Constants.scoreTextFontSize,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
