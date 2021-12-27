

import 'package:flutter/material.dart';

class AnimatedCounter extends StatelessWidget
{
  final int value;
  final Duration drution;

  const AnimatedCounter(
      {
        Key key,
        @required this.value,
        @required this.drution,
      }):super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TweenAnimationBuilder(
      duration: drution,
      tween: Tween(end: value.toDouble()),
      builder:(BuildContext context, value, child){
        final wo = value ~/1;
        final de = value - wo;
        print("wo = $wo + de = $de");
        return Stack(
          children: [
            Positioned(
              top: -100 * de,
              height: 100,
              child: Opacity(
                opacity: 1-de,
                child: Text("$wo",style: TextStyle(fontSize: 100)),
              ),
            ),
            Positioned(
              top: 100 - 100*de,
              height: 100,
              child: Opacity(
                opacity: de,
                child:Text("${wo+1}",style: TextStyle(fontSize: 100),) ,
              ),
            ),
          ],
        );
      },
    );
  }
}