

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/menu_pinterest.dart';

class PinteresButton{
  final IconData icon;
  final Function onPresed;

  PinteresButton({
    required this.icon, 
    required this.onPresed
     });

}

class PinteresMenu extends StatelessWidget {
 bool mostrar;  
final List<PinteresButton> items =[
  PinteresButton(icon: Icons.pie_chart, onPresed: (){ print('Pie chart');}),
  PinteresButton(icon: Icons.search, onPresed: (){ print('search');}),
  PinteresButton(icon: Icons.notifications, onPresed: (){ print('notificacion');}),
  PinteresButton(icon: Icons.supervised_user_circle, onPresed: (){ print('user');})
];

   PinteresMenu({ required this.mostrar});
  
  @override
  Widget build(BuildContext context) {
    return   ChangeNotifierProvider(
       create: (context) => SelectItemMenu(),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 200),
          opacity: (mostrar)?0:1,
          child: _PinteresMenuBackground(
           child: _MenuItems(items),
           ),
        ),
      );
    
  }
}

class _PinteresMenuBackground extends StatelessWidget {

  final Widget child;
   const _PinteresMenuBackground({required this.child});
   

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
       height: 60,
       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.circular(100),
         boxShadow: const [
           BoxShadow(
             color: Colors.black38,
             blurRadius: 10,
             spreadRadius: -5
           )
         ]
       ),
      child: child,
       
    );
  }
}


class _MenuItems extends StatelessWidget {
  

  final List<PinteresButton> menuItems;

  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (index) => _PinterestMenuButton(index, menuItems[index]))
    );
  }
}


class  _PinterestMenuButton extends StatelessWidget {

final int index;
final PinteresButton item;

  const  _PinterestMenuButton(this.index,  this.item);

  @override
  Widget build(BuildContext context) {

    final itemselecionado = context.watch<SelectItemMenu>().selectItemMenu;
    return GestureDetector(
      onTap: () {
        context.read<SelectItemMenu>().selectItemMenu = index;
        item.onPresed();
      },
      child: Container(
        child: Icon(
          item.icon,
          size: (itemselecionado==index)? 40: 25,
          color: (itemselecionado==index)? Colors.deepPurple : Colors.blueGrey,
          ),
      ),
    );
  }
}

