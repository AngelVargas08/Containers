
import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {

  final List<Widget>slidesx;
  final bool position;
  final Color colorprimary;
  final Color colorSecond;

  const Slideshow({super.key,  required this.slidesx, this.position = false,
   required this.colorprimary, required this.colorSecond });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _SliderModel(),
      child: SafeArea(
        child: Column(
          children:  [
            if (position) _Dots( slidesx.length,),
            Expanded(
              child: _Sliders(slidesx)
              ),
              if(!position) _Dots( slidesx.length,)
              ],
        ),
      ),
      
      );
  }
}


class _Sliders extends StatefulWidget {

final List<Widget>slides;

  const _Sliders(
     this.slides,
  );

  @override
  State<_Sliders> createState() => _SlidersState();
}

class _SlidersState extends State<_Sliders> {

    final pageviweContoller = PageController();


    @override
  void initState() {
    pageviweContoller.addListener(() {
        context.read<_SliderModel>().curretpage = pageviweContoller.page!;
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
      children: widget.slides.map((slide) =>_Slider( slide: slide,)).toList()
    );
  }
}

class _Slider extends StatelessWidget {
  final Widget slide;
  const _Slider({
    Key? key,
    required this.slide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(30),
        width: double.infinity,
        child: slide);
  }
}

class _Dots extends StatelessWidget {


  final int length;
  
  const _Dots( this.length, );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(length, (i) => _Dot(i))
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
 
  const _Dot( this.index,);

  @override
  Widget build(BuildContext context) {
    return Selector<_SliderModel,double>(
      selector: (p0, p1) => p1.curretpage,
      builder:(context, value, child) {
        double  x;
        (value >= index -0.5 && value <index +0.5)? x=22:x=15;
        return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.all(5),
      width: x,
      height: x,
      decoration:  BoxDecoration(
        color: (value >= index -0.5 && value <index +0.5)
        ? Colors.blue: Colors.purple,
        shape: BoxShape.circle
      ),
    );
      }, 
      
      ); 
    
    
  }
}


class _SliderModel extends ChangeNotifier{

    double _curretpage = 0;
    Color _colorprimary = Colors.blue;
    Color _colorSecond = Colors.purple;

    double get curretpage => _curretpage;
    
    set curretpage(double page){
        _curretpage = page;
        notifyListeners();
    }

    Color get colorprimary => _colorprimary;
    Color get colorSecond => _colorSecond;

    set colorprimary (Color color){
        _colorprimary = color;
        notifyListeners();
    }
    set colorSecond(Color color){
        _colorSecond = color;
        notifyListeners();
    }

}
