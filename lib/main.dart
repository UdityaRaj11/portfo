import 'package:flutter/material.dart';
import 'package:portfolio/screens/about.dart';
import 'package:portfolio/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uditya Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const MyHomePage(),
        '/about': (context) => const AboutMe(),
      },
    );
  }
}
