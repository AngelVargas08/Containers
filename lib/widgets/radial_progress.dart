
import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final porcentaje; 
  final Color colorPrimario; 
  final Color colorFondo; 
  
  const RadialProgress({
    required this.porcentaje, 
    this.colorPrimario = Colors.blue,  
    this.colorFondo = Colors.grey
    });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin{

late AnimationController controller;
late double porcentajeAnterior; 


@override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0.0);
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller, 
      builder: (context, child) {
        return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: AnimationProgress(
          (widget.porcentaje-diferenciaAnimar)+(diferenciaAnimar*controller.value),
          widget.colorPrimario,
          widget.colorFondo
          )
        ),
    );
      },
      );

  }
}

class AnimationProgress extends CustomPainter{

  final double porcentaje;
  final Color colorPrimario; 
  final Color colorFondo; 

  AnimationProgress(this.porcentaje, this.colorPrimario, this.colorFondo);
  @override
  void paint(Canvas canvas, Size size) {

      final pencil = Paint()
      ..color = colorFondo
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

       final Offset c = Offset(size.width*0.5, size.height*0.5);
       final double radius = min(size.width*0.5, size.height*0.5);

      canvas.drawCircle(c, radius, pencil);

      final pencilArc = Paint()
      ..color = colorPrimario
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
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