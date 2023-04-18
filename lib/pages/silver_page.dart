

import 'package:contenedores/widgets/button_floating.dart';
import 'package:contenedores/widgets/custom_scroll_view.dart';
import 'package:flutter/material.dart';

class SilverPage extends StatelessWidget {
   
  const SilverPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.grey[50],
      body: Stack(
        children: [
          MainScrool(),
          ButtonFloating()
        ],
      )
    );
  }
}