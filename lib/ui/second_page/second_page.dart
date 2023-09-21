import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/ui/second_page/second_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SecondCubit>(
      create: (context) => SecondCubit(),
      child: const SecondBuildWidget(),
    );
  }
}

class SecondBuildWidget extends StatelessWidget {
  const SecondBuildWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocConsumer<SecondCubit, int>(
        builder: (context, count) {
          return Column(
            children: [
              Center(
                child: Text(
                  '$count',
                  style: const TextStyle(
                    color: Colors.pink,
                    fontSize: 20
                  ),
                ),
              ),
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
              context.read<SecondCubit>().increment();
            },
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () {
              context.read<SecondCubit>().decrement();
            },
          ),
        ],
      ),
    );
  }
}
