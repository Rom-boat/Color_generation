import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Random _random = Random();
  Color _color = const Color.fromARGB(
      255, 255, 255, 255); // the starting position of the background

  void setRandomColors() {
    setState(() {
      _color = Color.fromARGB(
          //variable for a random number
          _random.nextInt(256),
          _random.nextInt(256),
          _random.nextInt(256),
          _random.nextInt(256));
    });
  }

  void snackBar(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SizedBox(
          height: 25,
          child: Text('$_color'),
        ),
        backgroundColor: (Colors.grey),
        duration: const Duration(milliseconds: 900),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello color'),
      ),
      body: GestureDetector(
        onTap: () {
          setRandomColors();
          snackBar(context);
        },
        child: Container(
          color: _color,
          child: Center(
            child: Text(
              "Привіт".toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade900,
                  fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
