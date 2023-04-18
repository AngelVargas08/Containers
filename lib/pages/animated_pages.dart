

import 'package:flutter/material.dart';
import 'dart:math'as Math;

class AnimacionesPAge extends StatelessWidget {
   
  const AnimacionesPAge({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
         child: AnimatedSquare(),
      ),
    );
  }
}

class _Square extends StatelessWidget {
  const _Square({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.deepPurple,
        ],
         begin: Alignment.topRight,
         end:  Alignment.bottomLeft
        )
      ),
    );
  }
}

class AnimatedSquare extends StatefulWidget {
  const AnimatedSquare({super.key});

  @override
  State<AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> rotation;

  late Animation<double> opacity;
   late Animation<double> opacityOut;

  late Animation<double> moveRight;
  late Animation<double> scale;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
    rotation = Tween(begin: 2 * Math.pi, end: 0.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut));
    opacity = Tween(begin:0.0,end:1.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0, 0.25, curve: Curves.easeOut))
    );
    opacityOut = Tween(begin:0.0,end:1.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.75, 1.0, curve: Curves.easeOut))
    );

    moveRight = Tween(begin: 0.0, end: 200.0).animate(controller);
    scale = Tween(begin: 0.0, end: 2.0).animate(controller);

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
      child: const _Square(),
      builder: (context, childRectangulo) {
        return Transform.translate(
          offset: Offset(moveRight.value, moveRight.value),
          child: Transform.rotate(
            angle: rotation.value ,
            child: Opacity(
              opacity: opacity.value - opacityOut.value,
              child: Transform.scale(
                scale: scale.value,
                child: childRectangulo)
              )
            ),
        );
      },
      );
  }
}