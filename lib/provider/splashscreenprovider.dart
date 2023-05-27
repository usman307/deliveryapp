import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled/firrstoreservices.dart';
import 'package:untitled/provider/upload_provider_picture_class.dart';
import 'package:untitled/splashscreen.dart';

import '../1stpage.dart';
class splashprovider with ChangeNotifier{
  void islogin(BuildContext context){

    Timer(Duration(seconds: 5), () => {

      Navigator.push(context, MaterialPageRoute(builder: (context)=>firstinterface()))
    });


  }






}