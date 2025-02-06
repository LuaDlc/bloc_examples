// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class EmailChanged extends LoginEvent {
  final String email;
  const EmailChanged({
    required this.email,
  });
}

class PasswordChanged extends LoginEvent {
  final String password;
  const PasswordChanged({
    required this.password,
  });
}

class LoginApi extends LoginEvent {}
