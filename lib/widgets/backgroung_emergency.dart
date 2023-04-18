

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class ContainerBackground extends StatelessWidget {

     final Color color1;
     final Color color2;
     final String subtitle; 
     final String title; 
     final IconData icone;
    
    const ContainerBackground({super.key, 
     this.color1 = const Color(0xff526bf6),
     this.color2 = const Color(0xff68acf2), 
     this.subtitle = 'Asistencia Medica',
     this.title = 'Haz solicitado',
     this.icone = FontAwesomeIcons.plus
     
     });
     
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:  [
        _BackgroundContainer(
          color1: color1,
          color2: color2
          ),
          _BodyContainer(
            title: title,
            subtitle: subtitle,
            icone: icone,
            ),
        _IconOpacity(icone: icone,),
        
      ],
    );
  }
}
//container gradient

class _BackgroundContainer extends StatelessWidget {

    late Color color1;
    late Color color2;

    _BackgroundContainer({
      required this.color1,
      required this.color2
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration:   BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
          color1,
          color2
        ]),
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(100))
      ),
    );
  }
}

//Icon Opacity
class _IconOpacity extends StatelessWidget {

   late IconData icone;

    _IconOpacity({required this.icone});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -60,
      left: -70,
      child: FaIcon(
        icone, size: 250, color: Colors.white.withOpacity(0.2),
        ),
    );
  }
}

//Column Widgets, text and icon

class _BodyContainer extends StatelessWidget {

  late String title;
  late String subtitle;
  late IconData icone;
  _BodyContainer({
    required this.title, 
    required this.subtitle,
    required this.icone
    });

  @override
  Widget build(BuildContext context) {
    final Color textwhite = Colors.white.withOpacity(0.7);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
                const SizedBox(height: 40,),
                Text(title, 
                style: TextStyle(fontSize: 20, color: textwhite),
                ),
                const SizedBox(height: 20,),
                Text(subtitle, 
                style: TextStyle(fontSize: 25, color: textwhite, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20,),
                      FaIcon(icone, size: 100,color: Colors.white,)

          ],
        ),
      ),
    );
  }
}



