import 'package:flutter/material.dart';
import 'counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterAppUi extends StatelessWidget {
  const CounterAppUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: buildWidget(context),
    );
  }

  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocConsumer<CounterCubit, int>(
        builder: (context, count){
          return Center(child: Text('$count'));
        },
        listener: (context, state) {

        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: (){
              context.read<CounterCubit>().increment();
            },
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: (){
              context.read<CounterCubit>().decrement();
            },
          ),
        ],
      ),
    );


  }
}
