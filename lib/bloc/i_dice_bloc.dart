import 'bloc.dart';

abstract class IDiceBloc extends Bloc {
  Stream<List<int>> get stream;

  void rollDices();

  List<int> defaultDices();
}
