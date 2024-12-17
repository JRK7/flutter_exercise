
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginUserNameChanged>((event, emit) {
      emit(state.copyWith(userName: event.userName));
    });

    on<LoginPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
  }
}
