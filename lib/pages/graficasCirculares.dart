


import 'package:contenedores/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({super.key});

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {

  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {

        setState(() {
          porcentaje +=10;
          if(porcentaje >100){
            porcentaje = 0;
          }
        });
      },
      child: const Icon(Icons.refresh),
      ),

      body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Circular_Progress(porcentaje: porcentaje, color: Colors.red,),
              Circular_Progress(porcentaje: porcentaje, color: Colors.blue)
            ],
          ),
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Circular_Progress(porcentaje: porcentaje, color: Colors.pink),
              Circular_Progress(porcentaje: porcentaje, color: Colors.purple)
            ],
          )
        ],
      )
    );
  }
}

class Circular_Progress extends StatelessWidget {
  const Circular_Progress({
    Key? key,
    required this.porcentaje, required this.color,
  }) : super(key: key);

  final double porcentaje;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color,
        colorFondo: Colors.grey,
        ),
    );
  }
}