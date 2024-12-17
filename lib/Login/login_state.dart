part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String userName;
  final String password;


  @override
  // TODO: implement props
  List<Object?> get props => [userName, password];

   const LoginState({this.userName = "", this.password = ""});

  LoginState copyWith({
    String? userName,
    String? password,
  }) {
    return LoginState(userName: userName ?? this.userName, password: password ?? this.password);
  }
}
