import 'package:contenedores/widgets/button_general.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/emergency_data.dart';
import '../widgets/backgroung_emergency.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        //Recibe parametros, colos texto icono
        Container(
          margin: const EdgeInsets.only(top: 200),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 80,),
              ...itemMap
              ],
          ),
        ),
        const ContainerBackground(),
      ],
    ));
  }
}

//