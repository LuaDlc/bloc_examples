import 'package:bloc_multiple_states/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_multiple_states/bloc/favourite/favourite_bloc.dart';
import 'package:bloc_multiple_states/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_multiple_states/bloc/todo/to_do_bloc.dart';
import 'package:bloc_multiple_states/repository/favourite_repository.dart';
import 'package:bloc_multiple_states/screens/favourite_app_screen.dart';
import 'package:bloc_multiple_states/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/switch_examples/switch_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SwitchBloc(),
          ),
          BlocProvider(
            create: (_) => CounterBloc(),
          ),
          BlocProvider(
            create: (_) => ImagePickerBloc(ImagePickerUtils()),
          ),
          BlocProvider(
            create: (_) => ToDoBloc(),
          ),
          BlocProvider(
            create: (_) => FavouriteBloc(FavouriteRepository()),
          ),
        ],
        child: BlocProvider(
          create: (context) => SwitchBloc(),
          child: MaterialApp(
              themeMode: ThemeMode.dark,
              title: 'Flutter Demo',
              theme: ThemeData(
                brightness: Brightness.dark,
                useMaterial3: true,
              ),
              home: const FavouriteAppScreen()),
        ));
  }
}
