import 'bloc.dart';

abstract class IDiceBloc extends Bloc {
  int get numberOfDices;

  Stream<List<int>> get stream;

  rollDices();

  List<int> defaultDices();
}
