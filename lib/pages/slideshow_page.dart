import 'package:contenedores/widgets/slidesshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Column(
          children: [
            Expanded(child: MySlideshow()),
            Expanded(child: MySlideshow())
          ],
        )
    );
  }
}

class MySlideshow extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Slideshow(
      colorSecond: Colors.red,
      colorprimary: Colors.black,
      position: false,
      slidesx: [
      SvgPicture.asset('assets/svg/1.svg'),
      SvgPicture.asset('assets/svg/2.svg'),
      SvgPicture.asset('assets/svg/3.svg'),
      SvgPicture.asset('assets/svg/4.svg'),
      SvgPicture.asset('assets/svg/5.svg'),
    ],);
  }
}