import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/1stpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled/cartscreen.dart';
import 'package:untitled/provider/cartprocider.dart';

import 'package:untitled/provider/getproduct.dart';
import 'package:untitled/provider/splashscreenprovider.dart';
import 'package:untitled/provider/timerclass.dart';
import 'package:untitled/provider/upload_provider_picture_class.dart';
import 'package:untitled/splashscreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp();


  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>splashprovider()),
        ChangeNotifierProvider(create: (_)=>uploadimage()),
ChangeNotifierProvider(create:(_)=>cartprovider() ),
      ChangeNotifierProvider(create: (_)=>productprovider()),
      ChangeNotifierProvider(create: (_)=>timerclass()),

    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: splashscreen(),


      ),
    );











  }
}

