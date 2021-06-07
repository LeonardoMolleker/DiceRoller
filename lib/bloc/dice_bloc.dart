import 'dart:async';
import 'dart:math';

import '../const/constants.dart';
import 'i_dice_bloc.dart';

class DiceBloc extends IDiceBloc {
  final int numberOfDices;
  StreamController<List<int>> _streamController =
      StreamController<List<int>>.broadcast();
  List<int> _values = [];

  DiceBloc({
    this.numberOfDices,
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
  void rollDices() {
    _values.clear();
    for (var i = 0; i < numberOfDices; i++) {
      int randomNumber = Random().nextInt(Constants.diceNumbers) + 1;
      _values.add(randomNumber);
    }
    _streamController.sink.add(_values);
  }

  @override
  Stream<List<int>> get stream => _streamController.stream;
}
