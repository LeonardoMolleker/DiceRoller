import 'dart:async';
import 'dart:math';

import '../const/constants.dart';
import 'i_dice_bloc.dart';

class DiceBloc extends IDiceBloc {
  int diceNumbers;
  StreamController<List<int>> _streamController =
      StreamController<List<int>>.broadcast();
  List<int> _values = [];

  DiceBloc({
    this.diceNumbers,
  });

  @override
  Future<void> initialize() {}

  List<int> defaultDices() {
    List<int> defaultDices = List.generate(
      numberOfDices,
          (index) {
        return Constants.defaultDiceValue;
      },
    );
    return defaultDices;
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  rollDices() {
    _values.clear();
    for (var i = 0; i < diceNumbers; i++) {
      _values.add(getRandomNumber());
    }
    _streamController.sink.add(_values);
  }

  int getRandomNumber() {
    return Random().nextInt(Constants.diceNumbers) + 1;
  }

  @override
  Stream<List<int>> get stream => _streamController.stream;

  @override
  int get numberOfDices => diceNumbers;
}
