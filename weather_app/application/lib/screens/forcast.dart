import 'package:flutter/material.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  final _items = const [
    { 'time': 'Tue, May 30 - 05:00 PM', 'temp': '21°C', 'desc': 'clear sky' },
    { 'time': 'Tue, May 30 - 08:00 PM', 'temp': '20°C', 'desc': 'clear sky' },
    { 'time': 'Tue, May 30 - 11:00 PM', 'temp': '12°C', 'desc': 'few clouds' },
    // more…
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: _items.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (c, i) {
        final it = _items[i];
        return ListTile(
          leading: const Icon(Icons.circle, color: Colors.orange),
          title: Text('${it['time']} – ${it['temp']}'),
          subtitle: Text(it['desc']!),
        );
      },
    );
  }
}
