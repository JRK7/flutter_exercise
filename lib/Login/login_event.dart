part of 'login_bloc.dart';

abstract class LoginEvent {

}

class LoginUserNameChanged extends LoginEvent {
  final String userName;
  LoginUserNameChanged(this.userName);
}

class LoginPasswordChanged extends LoginEvent {
  final String password;
  LoginPasswordChanged(this.password);
}