import 'dart:async';

import 'package:flutter/cupertino.dart';

class timerclass with ChangeNotifier{
//   Timer? _timer;
//   DateTime _dateTime = DateTime.now();
//    update() {
//      Timer.periodic(Duration(seconds: 1), (timer) {
//        _dateTime = DateTime.now();
//        notifyListeners();
//
//      }
//      );
//
//    }
// void stop(){
//      return _timer?.cancel();
// _timer = null;
//    }
//  DateTime get getdateTime => _dateTime;

  Timer? _timer;
  DateTime _currentTime = DateTime.now();

  DateTime get currentTime => _currentTime;

  void start() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _currentTime = DateTime.now();
      notifyListeners();
    });
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }


  @override
  void dispose() {
    stop();
    super.dispose();
  }




}