import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/ui/logic_example/logic_one_example.dart';
import 'package:flutter_bloc_demo/ui/stripe_integration/payment_screen/payment_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'db/hive_helper.dart';
import 'firebase_options.dart';
import 'models/cat_model.dart';
import 'other/multi_provider.dart';
import 'ui/razorpay_integration/razorpay_payment_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///payment gateways configurations
  Stripe.publishableKey = "pk_test_51OIpVrSGWisH9URHuBTBV7xcr6TWHQ7gsZ5s6ocvFlWe56glTAXKMgvawiI2yickbcYVKXikwHz3Vn85kZdiAJGv00jwXz9X64";
  await dotenv.load(fileName: "assets/.env");

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
      home: MultiBlocProvider(
        providers: AppMultiProviders.multiProviders,
        child: RazorpayPaymentScreen(),
      ),
    );
  }
}

/*
'/': (context) => const FirstPage(),
        '/second': (context) => const SecondPage(),
        '/third': (context) => const ThirdScreen(),
        '/hiveExample': (context) => const HiveExample(),
        */
