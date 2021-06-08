import 'bloc.dart';

abstract class IDiceBloc extends Bloc {
  Stream<List<int>> get stream;

  Stream<String> get scoreStream;

  void rollDices();

  List<int> defaultDices();
}
