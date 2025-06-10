import 'package:fitness_tracker/bmicalculate.dart';
import 'package:fitness_tracker/homepage.dart';
import 'package:fitness_tracker/landingone.dart';
import 'package:fitness_tracker/landingtwo.dart';
import 'package:fitness_tracker/list.dart';
import 'package:fitness_tracker/summary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => WorkoutProvider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Tracker',
      debugShowCheckedModeBanner: false,
      initialRoute: '/landingone',
      routes: {
        '/home': (context) => const HomePage(),
        '/landingone': (context) => const LandingOne(),
        '/landingtwo': (context) => const LandingTwo(),
        '/bmicalc': (context) => BMICalculate(),
        '/summary': (context) => Summary(),
      },
    );
  }
}
