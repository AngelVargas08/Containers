import 'package:flutter/material.dart';

class HeadersScreen  extends StatelessWidget {
   
  const HeadersScreen ({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _HeaderCustomPainter()
            ),
      )
    );
  }
}


class _HeaderCustomPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    
    final pencil = Paint();
    pencil.color = Colors.deepPurple;
    pencil.strokeWidth = 25;
    pencil.style = PaintingStyle.fill;

    final path = Path();
    path.lineTo(0, size.height*0.25);
    path.quadraticBezierTo(size.width*0.25, size.height*0.35, size.width*0.5, size.height*0.25);
    path.quadraticBezierTo(size.width*0.75, size.height*0.15, size.width, size.height*0.25);
    path.lineTo(size.width, 0);



    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}