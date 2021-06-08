import '../../bloc/dice_bloc.dart';
import '../../widgets/dice.dart';
import '../../const/constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DicePage extends StatefulWidget {
  final int crossAxisCount;
  final DiceBloc bloc;

  DicePage({
    this.crossAxisCount = Constants.defaultCrossAxisCount,
    this.bloc,
  });

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  String score;

  @override
  void initState() {
    super.initState();
    score = Constants.defaultScore;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Constants.dicePageTitle,
        ),
      ),
      body: StreamBuilder(
        initialData: widget.bloc.defaultDices(),
        stream: widget.bloc.stream,
        builder: (context, snapshot) {
          return GridView.count(
            childAspectRatio: Constants.aspectRatio,
            crossAxisCount: widget.crossAxisCount,
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
                child: StreamBuilder<Object>(
                    initialData: Constants.defaultScore,
                    stream: widget.bloc.scoreStream,
                    builder: (context, snapshot) {
                      return Text(
                        Constants.scoreText + snapshot.data,
                        style: TextStyle(
                          fontSize: Constants.scoreTextFontSize,
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> buildList(AsyncSnapshot snapshot) {
    var diceImages = snapshot.data.map<Widget>((value) {
      return Dice(
        widget.bloc.rollDices,
        value.toString(),
      );
    });
    return diceImages.toList();
  }
}
