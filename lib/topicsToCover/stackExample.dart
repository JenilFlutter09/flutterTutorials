import 'package:flutter/material.dart';

class stackExample extends StatelessWidget {
  const stackExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stack'), backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {},

          child: Container(height: 40, width: 50, color: Colors.blue),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('data'),
        icon: Icon(Icons.add_circle),
      ),
    );
  }
}

/// Stack
/// Circle Avatar
/// Elevated Button
/// TEXT Button
/// Icon Button
/// InkWell
/// Gesture Detector
/// Floating Action Button
