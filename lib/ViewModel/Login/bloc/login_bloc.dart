import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginSubmit> {
  LoginBloc() : super(const LoginSubmit("", "")) {
    on<LoginUserNameEvent>((event, emit) {
      emit(state.copyWith(userName: event.userName));
    });

    on<LoginPasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
  }
}
