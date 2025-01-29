import 'package:bloc_multiple_states/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_multiple_states/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_multiple_states/screens/image_picker_screen.dart';
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
          BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils()))
        ],
        child: BlocProvider(
          create: (context) => SwitchBloc(),
          child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const ImagePickerScreen()),
        ));
  }
}
