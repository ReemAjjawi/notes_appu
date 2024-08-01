import 'package:flutter/material.dart';

class PortraitLayout extends StatelessWidget {
  const PortraitLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: const Center(
          child: Text('PortraitLayout'),
        ),
      ),
    );
  }
}
