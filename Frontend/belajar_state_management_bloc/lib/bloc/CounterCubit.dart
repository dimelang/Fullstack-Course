import 'package:bloc/bloc.dart';

class Countercubit extends Cubit<int> {
  Countercubit() : super(0);

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }
}
