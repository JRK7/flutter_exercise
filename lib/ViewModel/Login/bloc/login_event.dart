part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginUserNameEvent extends LoginEvent {
  final String userName;

  const LoginUserNameEvent(this.userName);

  @override
  // TODO: implement props
  List<Object?> get props => [userName];
}

class LoginPasswordEvent extends LoginEvent {
  final String password;
  const LoginPasswordEvent(this.password);

  @override
  // TODO: implement props
  List<Object?> get props => [password];
}
