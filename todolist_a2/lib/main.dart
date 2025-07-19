import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My ToDo App',
      // theme: ThemeData(),  // Optional: customize theme later
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Optional: add controllers or state variables here
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // 1) Background layer: e.g. Image.asset or Container with decoration

          // 2) Foreground layer: your Column, TextField, list, etc.
        ],
      ),
      // Optional: add FloatingActionButton or other widgets here
    );
  }
}
