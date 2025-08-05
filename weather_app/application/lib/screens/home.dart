import 'package:flutter/material.dart';

class CurrentScreen extends StatelessWidget {
  const CurrentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircleAvatar(radius: 30, backgroundColor: Colors.orange),
          SizedBox(height: 16),
          Text('Vaxjö, SE', style: TextStyle(fontSize: 20)),
          SizedBox(height: 4),
          Text('Tue, May 30, 2023'),
          SizedBox(height: 4),
          Text('Clear sky'),
          SizedBox(height: 16),
          Text('22°C', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
