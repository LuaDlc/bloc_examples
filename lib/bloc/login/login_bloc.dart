import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_multiple_states/bloc/login/login_state.dart';
import 'package:http/http.dart' as http;

import 'login.event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_loginApi);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      email: event.email,
    ));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      password: event.password,
    ));
  }

  void _loginApi(LoginApi event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
      loginStatus: LoginStatus.loading,
    ));
    Map data = {'email': state.email, "password": state.password};

    try {
      final response =
          await http.post(Uri.parse('https://reqres.in/api/login'), body: data);
      var dataBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(state.copyWith(
            loginStatus: LoginStatus.success, message: 'Login succesfully'));
      } else {
        emit(state.copyWith(
            loginStatus: LoginStatus.error, message: dataBody['error']));
      }
    } catch (e) {
      emit(state.copyWith(message: e.toString()));
    }
  }
}
