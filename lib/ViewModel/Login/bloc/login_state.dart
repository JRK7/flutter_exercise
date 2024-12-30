part of 'login_bloc.dart';

final class LoginSubmit extends Equatable {
  final String userName;
  final String password;

  const LoginSubmit(this.userName, this.password);

  LoginSubmit copyWith({String? userName, String? password}) {
    return LoginSubmit(userName ?? this.userName, password ?? this.password);
  }

  @override
  List<Object?> get props => [userName, password];
}
