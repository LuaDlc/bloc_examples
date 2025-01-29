import 'package:bloc_multiple_states/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_multiple_states/bloc/counter_bloc/counter_event.dart';
import 'package:bloc_multiple_states/bloc/counter_bloc/counter_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterStates>(builder: (context, state) {
            return Center(
              child: Text(
                state.counter.toString(),
                style: const TextStyle(fontSize: 60),
              ),
            );
          }),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementCounter());
                  },
                  child: const Text('Increment')),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementCounter());
                  },
                  child: const Text('Decrement')),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(RestartCounter());
                  },
                  child: const Text('restart')),
            ],
          )
        ],
      ),
    );
  }
}
