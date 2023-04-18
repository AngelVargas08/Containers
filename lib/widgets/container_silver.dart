
import 'package:flutter/material.dart';



  

class ContainerSilver extends StatelessWidget {
 List  items = [
  const   Containerbk( 'Orange',  Color(0xffF08F66) ),
  const   Containerbk( 'Family',  Color(0xffF2A38A) ),
   const  Containerbk( 'Subscriptions', Color(0xffF7CDD5) ),
   const  Containerbk( 'Books',  Color(0xffFCEBAF) ),
   const  Containerbk( 'Orange',  Color(0xffF08F66) ),
   const  Containerbk( 'Family',  Color(0xffF2A38A) ),
   const  Containerbk( 'Subscriptions',  Color(0xffF7CDD5) ),
   const  Containerbk( 'Books',  Color(0xffFCEBAF) ),
  ];

   ContainerSilver({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder:(context, index) => items[index]
      );
  }
}

class Containerbk extends StatelessWidget {
  final String title;
  final Color color;

  const Containerbk( this.title,  this.color);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
          width: double.infinity,
          height: 130,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30)
          ),
          child: Row(
            children:  [
              const SizedBox(width: 30,),
               Text(title, 
              style: const TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),),
            ],
          ),
         );
  }
}

