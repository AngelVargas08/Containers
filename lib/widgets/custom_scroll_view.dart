



import 'package:contenedores/widgets/container_Silver.dart';
import 'package:contenedores/widgets/container_appbar.dart';
import 'package:flutter/material.dart';

class MainScrool extends StatelessWidget {
  final items = [
  const   Containerbk( 'Orange',  Color(0xffF08F66) ),
  const   Containerbk( 'Family',  Color(0xffF2A38A) ),
   const  Containerbk( 'Subscriptions', Color(0xffF7CDD5) ),
   const  Containerbk( 'Books',  Color(0xffFCEBAF) ),
   const  Containerbk( 'Orange',  Color(0xffF08F66) ),
   const  Containerbk( 'Family',  Color(0xffF2A38A) ),
   const  Containerbk( 'Subscriptions',  Color(0xffF7CDD5) ),
   const  Containerbk( 'Books',  Color(0xffFCEBAF) ),
  ];

   MainScrool({super.key});

  
  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      
      slivers: [
               SliverPersistentHeader(
                floating: true,
                delegate: _SliverCustomHeader(
                  minExten: 160 ,
                  maxExten: 165,
                  child: Container(
                    color: Colors.white,
                    child: ContainerAppbar(),
                  )
                )
                ),

              SliverList(
                delegate: SliverChildListDelegate(items) )
      ],
    );
  }
}


class _SliverCustomHeader extends SliverPersistentHeaderDelegate{
  final double maxExten;
  final double minExten;
  final Widget child;

  _SliverCustomHeader({
    required this.maxExten, 
    required this.minExten, 
    required this.child
    });
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
   return SizedBox.expand(child: child,);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxExten;

  @override
  // TODO: implement minExtent
  double get minExtent => minExten;

  @override
  bool shouldRebuild(covariant _SliverCustomHeader oldDelegate) {
    return maxExten != oldDelegate.maxExten || 
           minExten != oldDelegate.minExten || 
           child != oldDelegate.child; 
  }

}