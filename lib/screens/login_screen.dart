import 'package:bloc_multiple_states/bloc/login/login.event.dart';
import 'package:bloc_multiple_states/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailFocusNode = FocusNode();
  final passWordFocusNode = FocusNode();
  late LoginBloc _loginBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: BlocProvider(
            create: (_) => _loginBloc,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<LoginBloc, LoginState>(
                      buildWhen: (current, previous) =>
                          current.email != previous.email,
                      builder: (context, state) {
                        return TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          focusNode: emailFocusNode,
                          decoration: const InputDecoration(
                              hintText: 'Email', border: OutlineInputBorder()),
                          onChanged: (value) {
                            context
                                .read<LoginBloc>()
                                .add(EmailChanged(email: value));
                          },
                          onFieldSubmitted: (value) {},
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                      buildWhen: (current, previous) =>
                          current.password != previous.password,
                      builder: (context, state) {
                        return TextFormField(
                          keyboardType: TextInputType.text,
                          focusNode: passWordFocusNode,
                          decoration: const InputDecoration(
                              hintText: 'Password',
                              border: OutlineInputBorder()),
                          onChanged: (value) {
                            context
                                .read<LoginBloc>()
                                .add(PasswordChanged(password: value));
                          },
                          onFieldSubmitted: (value) {},
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state.loginStatus == LoginStatus.error) {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(SnackBar(
                              content: Text(state.message.toString())));
                      }
                      if (state.loginStatus == LoginStatus.loading) {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                              const SnackBar(content: Text('submitted')));
                      }
                      if (state.loginStatus == LoginStatus.success) {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(const SnackBar(
                              content: Text('login succesfully')));
                      }
                    },
                    child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return ElevatedButton(
                            onPressed: () {
                              context.read<LoginBloc>().add(LoginApi());
                            },
                            child: const Text('Login'));
                      },
                    ),
                  )
                ],
              ),
            )));
  }
}
