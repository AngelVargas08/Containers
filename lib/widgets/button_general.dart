

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonGeneral extends StatelessWidget {
   final Color color1;
  final Color color2;
   final IconData icon; 
   final String title;
   final Function onPressed;
  const ButtonGeneral({Key? key, 
  this.color1 = const Color(0xff6989f5),
    this.color2 = const Color(0xff906ef5),
    this.icon = FontAwesomeIcons.carBurst,
    this.title = 'Motor Accident',
   required this.onPressed}) 
   : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Stack(
        children: [
           _ContainerGradient(color1: color1, color2: color2,icon: icon),
           _ItemsContainer(icon: icon,title: title,)
           
          
        ],
      ),
    );
    
  }
}

class _ContainerGradient extends StatelessWidget {
  final Color color1;
  final Color color2;
   final IconData icon; 
  const _ContainerGradient({
    Key? key,
     required this.color1,
      required this.color2, 
      required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     margin:  const EdgeInsets.all(20),
     width: double.infinity,
     height: 110,
     decoration: BoxDecoration(
       color: Colors.red,
       borderRadius: BorderRadius.circular(20),
       gradient: LinearGradient(colors: [
         color1,
         color2
       ])
     ),
     child:_IconOpacity(icon: icon),
    );
  }
}

class _ItemsContainer extends StatelessWidget {
   final IconData icon; 
   final String title;
  const _ItemsContainer({
    Key? key, 
    required this.icon, 
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
           children:  [
            const SizedBox(width: 40),
            FaIcon(icon, size: 45,color: Colors.white,),
           const  SizedBox(width: 20),
             Expanded(
              child: Text(title, 
              style: const TextStyle(
                fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold
                ),
                ),
            ),
              const FaIcon(FontAwesomeIcons.chevronRight, size: 30,color: Colors.white,),
              const SizedBox(width: 40),
          ],
        ),
      ),
    );
  }
}

class _IconOpacity extends StatelessWidget {
  final IconData icon; 
  const _IconOpacity({
    super.key,
     required this.icon});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ClipRRect(
         borderRadius: BorderRadius.circular(20),
        child: FaIcon(
          icon, size:  160, color:
           Colors.white .withOpacity(0.3),),
      ),
    );
  }
}