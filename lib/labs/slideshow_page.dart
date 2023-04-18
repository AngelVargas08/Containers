import 'package:contenedores/provider/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideShowScreen extends StatelessWidget {
  const SlideShowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SliderModel(),
      child: Scaffold(
          body: Column(
        children: const [
          Expanded(
            child: _Sliders()
            ),
            _Dots()
            ],
      )
      ),
    );
  }
}

class _Sliders extends StatefulWidget {
  const _Sliders({
    Key? key,
  }) : super(key: key);

  @override
  State<_Sliders> createState() => _SlidersState();
}

class _SlidersState extends State<_Sliders> {

    final pageviweContoller = PageController();


    @override
  void initState() {
    pageviweContoller.addListener(() {
        context.read<SliderModel>().curretpage = pageviweContoller.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageviweContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageviweContoller,
      children: const [
        _Slider(
          svg: 'assets/svg/1.svg',),
        _Slider(
          svg: 'assets/svg/2.svg',),
        _Slider(
          svg: 'assets/svg/3.svg',)
      ],
    );
  }
}

class _Slider extends StatelessWidget {
  final String svg;
  const _Slider({
    Key? key,
    required this.svg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(30),
        width: double.infinity,
        child: SvgPicture.asset(svg));
  }
}

class _Dots extends StatelessWidget {
  const _Dots({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const[
          _Dot(index: 0,),
          _Dot(index: 1,),
          _Dot(index: 2,),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final double index;
  const _Dot({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Selector<SliderModel,double>(
      selector: (p0, p1) => p1.curretpage,
      builder:(context, value, child) {
        return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.all(5),
      width: 18,
      height: 18,
      decoration:  BoxDecoration(
        color: (value >= index -0.5 && value <index +0.5)
        ? Colors.blue : Colors.grey,
        shape: BoxShape.circle
      ),
    );
      }, 
      
      ); 
    
    
  }
}
