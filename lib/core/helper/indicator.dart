import 'package:flutter/material.dart';
import 'package:ride_application/core/resources/managers/colors_manager.dart';

class Indicator extends StatelessWidget {
  const Indicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator.adaptive();
  }
}
