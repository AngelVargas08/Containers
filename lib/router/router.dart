
import 'package:contenedores/main.dart';
import 'package:contenedores/pages/launcher_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../pages/pages.dart';



mixin RouterMixin{
  
  final _router = GoRouter(
    routes: [
      GoRoute(path: '/',
      name: 'home',
      builder: (_, __) => const LauncherPage(),
      ),
      GoRoute(path: '/slideshow',
      name: 'slideshow',
      builder: (_, __) => const SlideshowPage (),
      ),
      GoRoute(path: '/emergency',
      builder: (_, __) => const EmergencyPage (),
      ),
      GoRoute(path: '/header',
      builder: (_, __) => const HeadersScreen (),
      ),
      GoRoute(path: '/animated',
      builder: (_, __) => const AnimacionesPAge (),
      ),
      GoRoute(path: '/progress',
      builder: (_, __) => const GraficasCircularesPage(),
      ),
      GoRoute(path: '/pinterest',
      
      builder: (_, __) => const PinterestPage(),
      ),
      GoRoute(path: '/silvers',
      builder: (_, __) => const SilverPage(),
      ),
      
  ]
  );
 
 GoRouter get router => _router;

}

class _Router{

final IconData icon;
final String title;
final String page;

  _Router({
    required this.icon, 
    required this.title, 
    required this.page
    });

}


final pageRoutes = <_Router>[

  _Router(icon: FontAwesomeIcons.slideshare, title: 'Slideshow',page:'/slideshow' ),
  _Router(icon: FontAwesomeIcons.ambulance, title: 'Emergency',page:'/emergency' ),
  _Router(icon: FontAwesomeIcons.heading, title: 'Encabezados',page: '/header'),
  _Router(icon: FontAwesomeIcons.peopleCarryBox, title: 'Cuadro Animado',page:'/animated' ),
  _Router(icon: FontAwesomeIcons.circleNotch, title: 'Barra progreso',page: '/progress'),
  _Router(icon: FontAwesomeIcons.pinterest, title: 'Pinterest',page: '/pinterest'),
  _Router(icon: FontAwesomeIcons.mobile, title: 'Slivers',page:'/silvers' ),
  
];


