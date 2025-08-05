import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: Center(
        child: Text(
          'Project Weather\n\n'
          'This is an app developed for the course 1DV535 at Linnaeus University\n'
          'using Flutter and the OpenWeatherMap API.\n\n'
          'Developed by...\n'
          'Abdifataah Abdillahi Ali',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
