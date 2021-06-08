import 'bloc/dice_bloc.dart';
import 'src/pages/dice_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final DiceBloc bloc = DiceBloc(
    numberOfDices: 6,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DicePage(
        bloc: bloc,
      ),
    );
  }
}
