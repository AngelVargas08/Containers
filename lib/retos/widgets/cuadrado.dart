

import 'package:flutter/material.dart';

class Cuadrado extends StatelessWidget {
  const Cuadrado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(colors:[
          Colors.purple,
          Colors.blue
        ])
      ),
    );
  }
}