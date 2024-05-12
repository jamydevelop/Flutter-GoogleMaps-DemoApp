import 'package:flutter/material.dart';
//import 'package:flutter_google_maps/home_page_screen.dart';
import 'package:flutter_google_maps/screens/myappp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const MyHomePage(),
      home: const MyAppp(),
    );
  }
}
