

import 'package:animate_do/animate_do.dart';
import 'package:contenedores/widgets/button_general.dart';
import 'package:flutter/Material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}

final items = <ItemBoton>[
   ItemBoton( FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
   ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
   ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
   ItemBoton( FontAwesomeIcons.biking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
   ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
   ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
   ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
   ItemBoton( FontAwesomeIcons.biking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
   ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
   ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
   ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
   ItemBoton( FontAwesomeIcons.biking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
];

 List<Widget>itemMap = items.map(
      (e) => FadeInLeft(
        duration: const Duration(milliseconds: 300),
        child: ButtonGeneral(
          color1: e.color1,
          color2: e.color2,
          icon: e.icon,
          title: e.texto,
          onPressed: (){}),
      ),
      ).toList();
  