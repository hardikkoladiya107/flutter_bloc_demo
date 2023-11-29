import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'third_event.dart';
part 'third_state.dart';

class ThirdBloc extends Bloc<ThirdEvent, ThirdState> {
  ThirdBloc() : super(ThirdInitial()) {
    on<ThirdEvent>((event, emit) {

    });
  }
}
