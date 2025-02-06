// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

enum LoginStatus { initial, loading, success, error }

class LoginState extends Equatable {
  final String password;
  final String email;
  final String message;
  final LoginStatus loginStatus;

  const LoginState(
      {this.password = '',
      this.email = '',
      this.message = '',
      this.loginStatus = LoginStatus.initial});

  LoginState copyWith(
      {String? email,
      String? password,
      String? message,
      LoginStatus? loginStatus}) {
    return LoginState(
        password: password ?? this.password,
        email: email ?? this.email,
        message: message ?? this.message,
        loginStatus: loginStatus ?? this.loginStatus);
  }

  @override
  List<Object?> get props => [email, password, message, loginStatus];
}
