import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ui/first_page/first_cubit.dart';
import '../ui/second_page/second_cubit.dart';

class AppMultiProviders {
  static List<BlocProvider> multiProviders = [
    BlocProvider<FirstCubit>(
      create: (BuildContext context) => FirstCubit(),
    ),
    BlocProvider<SecondCubit>(
      create: (BuildContext context) => SecondCubit(),
    ),
  ];
}
