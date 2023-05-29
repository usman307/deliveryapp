

import 'package:flutter/material.dart';
import 'dart:math'as math;

import 'package:lottie/lottie.dart';
class AnimatedImage extends StatefulWidget {
  @override
  _AnimatedImageState createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage> with SingleTickerProviderStateMixin {
late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 100),
    vsync: this)..repeat();

  @override
  void initState() {
    super.initState();
_controller.dispose();
  }

  @override
Widget build(BuildContext context ){
    return Scaffold(
body:  Column(
  children: [
    AnimatedBuilder(
  animation: _controller,
  child:Container(

    // height:  200,
    // width: 200,
    child: Column(
    children:[
    Lottie.network('https://assets1.lottiefiles.com/packages/lf20_jmejybvu.json'),
    SizedBox(height: 10,),
    Align(
        alignment: Alignment.center,
        child: Text('Thank you For Placeing Order',style: TextStyle(fontSize: 20),)),

  ]
)
    ) ,

  builder: (BuildContext context,child){

return Transform.translate(offset:Offset(0,250),
child: child,

);

  }
  ),

  ],
),
    );
  }


}
