import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Image.asset('assets/images/wallpaper.jpeg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          )
        ],
      ),
    );
  }
}