import 'package:flutter_bloc/flutter_bloc.dart';

//abstract

abstract class MaggiState {}

abstract class MaggiEvent {}

//state

class InitialMaggi extends MaggiState {}

class LoadingMaggi extends MaggiState {
  final String cooking;

  LoadingMaggi({required this.cooking});
}

class LoadedMaggi extends MaggiState {}

class ErrorMaggi extends MaggiState {
  final String? msg;

  ErrorMaggi({this.msg});
}

//event

class MasakMaggi extends MaggiEvent {
  final int telur;
  MasakMaggi({required this.telur});
}

//bloc

class MaggiBloc extends Bloc<MaggiEvent, MaggiState> {
  //constructor
  MaggiBloc() : super(InitialMaggi()) {
    on<MasakMaggi>(_onMasakMaggi);
  }

  _onMasakMaggi(MasakMaggi event, Emitter<MaggiState> emit) async {
    emit(LoadingMaggi(cooking: 'Masak maggi dengan ${event.telur}'));
    await Future.delayed(const Duration(seconds: 3));
    if (event.telur < 3) {
      emit(LoadedMaggi());
    } else {
      emit(ErrorMaggi(msg: 'Error telur'));
    }
  }
}
