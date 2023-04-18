import 'package:contenedores/retos/widgets/cuadrado.dart';
import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationCuadrado extends StatefulWidget {
  const AnimationCuadrado({super.key});

  @override
  State<AnimationCuadrado> createState() => _AnimationCuadradoState();
}

class _AnimationCuadradoState extends State<AnimationCuadrado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotation;
  late Animation<double> right;
  late Animation<double> top;
  late Animation<double> left;
  late Animation<double> down;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4500));
    rotation = Tween(begin: 0.0, end: 4.0 * Math.pi).animate(controller);
    down = Tween(begin: 0.0, end: 800.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.25, curve: Curves.bounceOut)));

    right = Tween(begin: 0.0, end: 430.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.25, 0.50, curve: Curves.bounceOut)));

        top = Tween(begin: 0.0, end: -800.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.50, 0.75, curve: Curves.bounceOut)));

        left = Tween(begin: 0.0, end: -430.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.bounceOut)));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.repeat();
    return AnimatedBuilder(
      animation: controller,
      child: const Cuadrado(),
      builder: (context, childCuadrado) {
        return Transform.translate(
          offset: Offset(right.value + left.value, down.value + top.value),
          child: Transform.rotate(
            angle: rotation.value,
            child: childCuadrado,
          ),
        );
      },
    );
  }
}
