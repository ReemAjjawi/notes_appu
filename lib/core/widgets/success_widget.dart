import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.green),
      child: const Center(
        child: Icon(
          Icons.verified,
          color: Colors.white,
        ),
      ),
    );
  }
}
