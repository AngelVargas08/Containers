
import 'package:contenedores/router/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme/themeprovider.dart';



void main() => runApp(
   ChangeNotifierProvider(
    create: (context) => ThemePri(),
    child: MyApp())
   );

class MyApp extends StatelessWidget with RouterMixin{
   MyApp({super.key});

  

  @override
  Widget build(BuildContext context) {
    final themedata = context.select<ThemePri,ThemeData>((value) => value.curretTheme);
   //final themedata = context.watch<ThemePri>().curretTheme;
    return MaterialApp.router(
      theme: themedata,
       debugShowCheckedModeBanner: false,
      routerConfig: router,
      
    );
  }
}

