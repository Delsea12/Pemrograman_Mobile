import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dropdown Menu Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dropdown Menu Example'),
        ),
        body: const Center(
          child: DropdownExample(),
        ),
      ),
    );
  }
}

class DropdownExample extends StatefulWidget {
  const DropdownExample({super.key});
  
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String _selectedItem = 'Option 1';
  List<String> _dropdownItems = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedItem,
      onChanged: (String? newValue) {
        setState(() {
          _selectedItem = newValue!;
        });
      },
      items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
