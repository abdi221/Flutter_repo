import 'package:flutter/material.dart';
import '../models/todo.dart'; // if you need Todo here; otherwise drop

enum SortOrder { creationDate, deadline, alphabetical }

class Settings {
  bool hideCompleted;
  SortOrder sortOrder;
  bool darkMode;

  Settings({
    this.hideCompleted = false,
    this.sortOrder = SortOrder.creationDate,
    this.darkMode = false,
  });
}

class SettingsPage extends StatefulWidget {
  final Settings settings;

  const SettingsPage({super.key, required this.settings});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    // Pull the object out for easier typing:
    Settings s = widget.settings;

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          // 1) Hide completed tasks toggle
          SwitchListTile(
            title: const Text('Hide completed tasks'),
            value: s.hideCompleted,
            onChanged: (bool val) {
              setState(() {
                s.hideCompleted = val;
              });
            },
          ),

          // 2) Sort order dropdown
          ListTile(
            title: const Text('Sort order'),
            trailing: DropdownButton<SortOrder>(
              value: s.sortOrder,
              items: [
                DropdownMenuItem(
                  value: SortOrder.creationDate,
                  child: Text('By creation date'),
                ),
                DropdownMenuItem(
                  value: SortOrder.deadline,
                  child: Text('By deadline'),
                ),
                DropdownMenuItem(
                  value: SortOrder.alphabetical,
                  child: Text('Alphabetical'),
                ),
              ],
              onChanged: (SortOrder? val) {
                if (val != null) {
                  setState(() {
                    s.sortOrder = val;
                  });
                }
              },
            ),
          ),

          // Dark mode
          SwitchListTile(
            title: const Text('Dark mode'),
            value: s.darkMode,
            onChanged: (bool val) {
              setState(() {
                s.darkMode = val;
              });
            },
          ),
        ],
      ),
    );
  }
}
