import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/ui/first_page/first_page.dart';
import 'package:flutter_bloc_demo/ui/hive_crud/hive_example.dart';
import 'package:flutter_bloc_demo/ui/second_page/second_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'db/hive_helper.dart';
import 'models/cat_model.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CatModelAdapter());
  await hiveHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const FirstPage(),
        '/second': (context) => const SecondPage(),
        '/hiveExample': (context) => const HiveExample(),
      },
    );
  }
}
