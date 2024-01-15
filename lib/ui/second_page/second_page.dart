import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/ui/second_page/second_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocConsumer<SecondCubit, SecondState>(
        builder: (context, state) {
          return Column(
            children: [
              ///showing state
              Text(
                '$state',
                style: const TextStyle(color: Colors.pink, fontSize: 20),
              ),

              ///i have written variable directly in cubit
              Text(
                context.read<SecondCubit>().counterCheck.toString(),
                style: const TextStyle(color: Colors.pink, fontSize: 20),
              ),

              ///i have written variable in state class
              (state is InitialState)
                  ? Text(
                state.counter.toString(),
                style: const TextStyle(color: Colors.pink, fontSize: 20),
              )
                  : Container()
            ],
          );
        },
        listener: (context, state) {
          if (state is InitialState) {
            print(state.counter.toString());
          } else {
            print(state.toString());
          }
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              context.read<SecondCubit>().changeValueInCubit();
            },
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () {
              if(context.read<SecondCubit>().state is InitialState){
                context.read<SecondCubit>().changeValueInState();
              }
            },
          ),
        ],
      ),
    );
  }
}
