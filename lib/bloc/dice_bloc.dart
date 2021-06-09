import 'dart:async';
import 'dart:math';

import '../const/constants.dart';
import 'i_dice_bloc.dart';

class DiceBloc extends IDiceBloc {
  final int numberOfDices;
  StreamController<List<int>> _streamController =
      StreamController<List<int>>.broadcast();
  List<int> _values = [];
  StreamController<String> _scoreController =
      StreamController<String>.broadcast();

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
    _scoreController.close();
  }

  @override
  void rollDices() {
    int _temporalScore = 0;
    _values.clear();
    for (var i = 0; i < numberOfDices; i++) {
      int randomNumber = Random().nextInt(Constants.diceNumbers) + 1;
      _temporalScore += randomNumber;
      _values.add(randomNumber);
    }
    _streamController.sink.add(_values);
    _scoreController.sink.add(_temporalScore.toString());
  }

  @override
  Stream<List<int>> get stream => _streamController.stream;

  @override
  Stream<String> get scoreStream => _scoreController.stream;
}
