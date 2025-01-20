import 'package:bloc/bloc.dart';

class Themechangercubit extends Cubit<bool> {
  Themechangercubit() : super(true);

  void changeTheme() {
    emit(!state);
  }
}
