
import 'package:flutter/material.dart';

class ButtonFloating extends StatelessWidget {
  const ButtonFloating({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomRight,
      child: InkWell(
        onTap: () {
          
        },
        child: Container(
              width: size.width*0.9,
              height: 100,
              decoration:const BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('CREATE NEW LIST',  style: TextStyle(
                    fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold,letterSpacing: 3
                  ),),
                ],
              ),
        ),
      ),
    );
  }
}