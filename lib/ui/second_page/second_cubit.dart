import 'package:flutter_bloc/flutter_bloc.dart';

class SecondCubit extends Cubit<SecondState> {
  SecondCubit() : super(InitialState());

  num counterCheck = 0;

  changeValueInCubit() {
    (state as InitialState).counter;
    counterCheck++;
    emit(InitialState());
  }

  changeValueInState() {
    emit(InitialState().addValue());
  }
}

class SecondState {}

class InitialState extends SecondState {
  int counter;

  InitialState({this.counter = 0});

  SecondState addValue() {
    counter = counter + 1;
    return InitialState();
  }
}

class LoadingState extends SecondState {}
