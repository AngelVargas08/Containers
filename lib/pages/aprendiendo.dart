

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
              children: [
               Center(
                 child: Container(
                   width: 200,
                   height: 200,
                   decoration:  BoxDecoration(
                     shape: BoxShape.circle,
                     gradient: const LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.purple
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                      ),
                      border: Border.all(
                        color: Colors.black12,
                        width: 2,
                      ),
                      boxShadow: const [BoxShadow(color: Colors.black12,
                      offset: Offset(4,6)
                      )],
                      
                   ),
                   child: const Center(
                    child:  Text("Angel Vargas")),
                 ),
               )
              ],
        ),
      ),
    );
  }
}