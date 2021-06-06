import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatelessWidget {
  Tween<double> _scaleTween = Tween<double>(begin: 1, end: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<double>(
            builder: (BuildContext context, double? scale, Widget? child) {
              return Transform.scale(scale: scale!, child: child);
            },
            duration: Duration(milliseconds: 600),
            tween: _scaleTween,
            child: Image.asset(
              'images/logo.png',
              scale: 15,
            ),
            onEnd: () {
              Future.delayed(Duration(seconds: 1), () {
                Modular.to.pushReplacementNamed('/');
              });
            }),
      ),
    );
  }
}
