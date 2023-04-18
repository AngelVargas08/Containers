
import 'package:contenedores/theme/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../router/router.dart';

class LauncherPage extends StatelessWidget {
   
  const LauncherPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Diseños en Flutter'),
      ),
     drawer: _LateralMenu(),
      body:  _ContentMenu()
    );
  }
}

class _ContentMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final curret = context.select<ThemePri, bool>((value) => value.darkmode);
    return ListView.builder(
      
      physics: const BouncingScrollPhysics(),
      itemCount: pageRoutes.length,
      itemBuilder: (context, index) =>  Container(
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: (curret)?Colors.black45 : Colors.grey[100] ,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Center(
          child: ListTile(
            leading:  Icon(pageRoutes[index].icon, size: 30,color: Colors.blue,),
            title:  Text(pageRoutes[index].title),
            trailing: const Icon(Icons.chevron_right_rounded, size: 30,),
            onTap: () {
              GoRouter.of(context).push(pageRoutes[index].page);
              
            },
          ),
        ),
      ), 
      
      
      );
  }
}

class _LateralMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final theme2 = context.watch<ThemePri>();
    return Drawer(
      child: SafeArea(
        child: Column(
          children:  [
            const CircleAvatar(
              radius: 80,
              child: Text('AV', style: TextStyle(fontSize: 50),),
            ),
            Expanded(
              child:  _ContentMenu()
            ),
            ListTile(
              leading: const Icon(Icons.lightbulb_outline),
              title: const Text('Dark Mode'),
              trailing: Switch.adaptive(
                activeColor: Colors.blue,
                value: theme2.darkmode, 
                onChanged: (value) => theme2.darkmode = value,),
            ),
              
            ListTile(
              leading: const Icon(Icons.add_to_home_screen),
              title: const Text('Custom Theme'),
              trailing: Switch.adaptive(
                activeColor: Colors.blue,
                value: theme2.customMode,
                 onChanged: (v) => theme2.customMode = v),
            ),

           
          ],
        ),
      ));
  }
}
