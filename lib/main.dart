import 'package:flutter/material.dart';
import 'starting_page.dart';

void main() {
  runApp(const HuniApp());
}

class HuniApp extends StatelessWidget {
  const HuniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HUNI',
      theme: ThemeData(
        fontFamily: 'Arial',
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const StartingPage(),
    );
  }
}
