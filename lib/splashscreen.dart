import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/splashscreenprovider.dart';
import 'dart:math' as math;


class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> with SingleTickerProviderStateMixin {

 late final AnimationController _controller = AnimationController(
     duration: Duration(seconds: 100),
     vsync: this)..repeat();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    final splash = Provider.of<splashprovider>(context,listen: false);

splash.islogin(context);
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SafeArea(
        child: Scaffold(
          backgroundColor: Colors.pink,
          body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                      animation: _controller,
                      child:Center(
                        child: Container(
                        //    height:300,
                          //  width: MediaQuery.of(context).size.width*0.50,
                          //  width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(200),
                                child: Image.asset('assets/panda.png',height: 100,width: 100,))
                        
                        ),
                      )  ,
                      builder: (BuildContext context,child){
                        return Transform.rotate(angle:_controller.value *2*math.pi,
                        child: child,
                        );

                      }

                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 150),
                  //   child:
                  // ),
                ],




          ),
        ),
      ),
    );

  }
}
