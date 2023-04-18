
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../provider/menu_pinterest.dart';
import '../widgets/pinteres_menu.dart';

class PinterestPage extends StatelessWidget {
   
  const PinterestPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    return  ChangeNotifierProvider(
      create: (context) => SelectItemMenu(),
      child: Scaffold(
        body: Stack(children: [
          PinteresGrid(),
          const _PinteresMenuLocation()
        ],)
      ),
    );
  }
}

class _PinteresMenuLocation extends StatelessWidget {
  const _PinteresMenuLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mostrar = context.watch<SelectItemMenu>().mostrar;
    return Positioned.fill(
      bottom: 30,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: PinteresMenu(
          mostrar: mostrar,
        )),
    );
  }
}

class PinteresGrid extends StatefulWidget {
  PinteresGrid({super.key});

  @override
  State<PinteresGrid> createState() => _PinteresGridState();
}

class _PinteresGridState extends State<PinteresGrid> {
final  List<int> items = List.generate(200, (index) => index);

ScrollController controller = ScrollController();
double anterior = 10;


@override
  void initState() {
    
    controller.addListener(() {
      if(controller.offset>anterior && controller.offset>100){
        context.read<SelectItemMenu>().mostrar =true;
      }else{
        context.read<SelectItemMenu>().mostrar =false;
      }
      
        anterior = controller.offset;
        
        


    });


    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
  controller: controller,
  crossAxisCount: 4,
  itemCount: items.length,
  itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
  staggeredTileBuilder: (int index) =>
       StaggeredTile.count(2, index.isEven ? 2 : 3),
  mainAxisSpacing: 4.0,
  crossAxisSpacing: 4.0,
);
  }
}

class _PinterestItem extends StatelessWidget {

  final int index;
  const _PinterestItem( this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.deepPurple[200],
        borderRadius: const BorderRadius.all(Radius.circular(30))
      ),
       
        child:  Center(
          child:  CircleAvatar(
            backgroundColor: Colors.white,
            child:  Text('$index',style: const TextStyle(color: Colors.deepPurple),),
          ),
        ));
  }
}