import 'package:flutter/material.dart';
import 'package:tetris/gamer/gamer.dart';
import 'package:tetris/gamer/keyboard.dart';

import 'home_page.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

class FlutterTetris extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [routeObserver],
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Game(child: KeyboardController(child: HomePage())),
      ),
    );
  }
}