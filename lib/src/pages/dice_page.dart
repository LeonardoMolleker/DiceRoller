import '../../bloc/i_dice_bloc.dart';
import '../../widgets/dice.dart';
import '../../const/constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DicePage extends StatelessWidget {
  final String ext;
  final String path;
  final int crossAxisCount;
  final IDiceBloc bloc;

  DicePage({
    this.path = Constants.defaultPath,
    this.ext = Constants.defaultExt,
    this.crossAxisCount = Constants.defaultCrossAxisCount,
    this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Constants.dicePageTitle,
        ),
      ),
      body: StreamBuilder(
        initialData: defaultDices(),
        stream: bloc.stream,
        builder: (context, snapshot) {
          return GridView.count(
            childAspectRatio: Constants.aspectRatio,
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: Constants.gridViewPaddingTop,
            children: buildList(
              snapshot,
            ),
          );
        },
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
            Padding(
              padding: const EdgeInsets.only(
                right: Constants.containerPaddingRight,
                top: Constants.containerPadding,
              ),
              child: Container(
                height: Constants.containerHeight,
                child: Text(
                  Constants.rollThemText,
                  style: TextStyle(
                    fontSize: Constants.indicatorTextFontSize,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: Constants.containerPadding,
              ),
              child: Container(
                child: Text(
                  "Score: 21",
                  style: TextStyle(
                    fontSize: Constants.scoreTextFontSize,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> buildList(AsyncSnapshot snapshot) {
    return snapshot.data.map<Widget>((value) {
      return Dice(bloc, path, ext, value);
    }).toList();
  }

  List<int> defaultDices() {
    List<int> defaultDices = List.generate(
      bloc.numberOfDices,
      (index) {
        return Constants.defaultDiceValue;
      },
    );
    return defaultDices;
  }
}
