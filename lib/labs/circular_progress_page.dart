
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressScreen extends StatefulWidget {
   
  const CircularProgressScreen({Key? key}) : super(key: key);

  @override
  State<CircularProgressScreen> createState() => _CircularProgressScreenState();
}

class _CircularProgressScreenState extends State<CircularProgressScreen> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  double porcentaje = 0.0;
  double nuevoporcentaje = 0.0;

  @override
  void initState() {

    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));

    controller.addListener(() { 
      setState(() {
        porcentaje = lerpDouble(porcentaje, nuevoporcentaje, controller.value)!;
      });

        
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          porcentaje = nuevoporcentaje;
          nuevoporcentaje +=10;
          if(nuevoporcentaje >100){
            nuevoporcentaje = 0;
            porcentaje = 0;
          }
          controller.forward(from: 0.0);
          setState(() {
            
          });
        },
        child: Icon(Icons.refresh, size: 40,),
        backgroundColor: Colors.pink,
        ),
      body: Center(
         child: SizedBox(
            width: 300,
            height: 300,
            child: CustomPaint(
              painter: AnimationProgress(porcentaje),
            ),
         ),
      ),
    );
  }
}

class AnimationProgress extends CustomPainter{

  final double porcentaje;

  AnimationProgress(this.porcentaje);
  @override
  void paint(Canvas canvas, Size size) {

      final pencil = Paint()
      ..color = Colors.grey
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

       final Offset c = Offset(size.width*0.5, size.height*0.5);
       final double radius = min(size.width*0.5, size.height*0.5);

      canvas.drawCircle(c, radius, pencil);

      final pencilArc = Paint()
      ..color = Colors.pink
      ..strokeWidth = 15
      ..style = PaintingStyle.stroke;

      final double arcAngle = 2 * pi*(porcentaje/100);

      canvas.drawArc(
        Rect.fromCircle(center: c, radius: radius), 
        -pi/2, 
        arcAngle, 
        false, 
        pencilArc);

        

   
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}