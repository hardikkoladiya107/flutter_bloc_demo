import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/ui/firestore_crud/firestore_example.dart';
import 'package:flutter_bloc_demo/ui/third_page/third_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'db/hive_helper.dart';
import 'firebase_options.dart';
import 'models/cat_model.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: ThirdScreen(),
    );
  }
}

/*
'/': (context) => const FirstPage(),
        '/second': (context) => const SecondPage(),
        '/third': (context) => const ThirdScreen(),
        '/hiveExample': (context) => const HiveExample(),
        */
