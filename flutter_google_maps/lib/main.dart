import 'package:flutter/material.dart';
import 'package:flutter_google_maps/screens/google_map_screens/gmap_screen_four.dart';



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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      //home: const MyHomePage(),
      home: const GMapScreenFour(),
    );
  }
}
