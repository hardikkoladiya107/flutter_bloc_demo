import 'package:flutter/material.dart';
import 'first_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FirstCubit>(
      create: (context) => FirstCubit(),
      child: const CounterBuildWidget(),
    );
  }
}

class CounterBuildWidget extends StatelessWidget {
  const CounterBuildWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocConsumer<FirstCubit, int>(
        builder: (context, count) {
          return Column(
            children: [
              Center(child: Text('$count')),
              Text(context.watch<FirstCubit>().state.toString()),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/second");
                },
                child: const Text("Next"),
              )
            ],
          );
        },
        listener: (context, state) {},
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              context.read<FirstCubit>().increment();
            },
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () {
              context.read<FirstCubit>().decrement();
            },
          ),
        ],
      ),
    );
  }
}
