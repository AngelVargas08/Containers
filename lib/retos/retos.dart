

import 'package:contenedores/retos/widgets/animation_cuadrado.dart';
import 'package:flutter/material.dart';


class RetosScreen  extends StatelessWidget {
   
  const RetosScreen ({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(bottom: 800),
        child: AnimationCuadrado(),
      ),
      
    );
  }
}





