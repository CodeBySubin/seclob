import 'package:flutter/material.dart';

class IntroductionViewModel extends ChangeNotifier{

  void spashNavigation(VoidCallback onComplete) {
    Future.delayed(Duration(seconds: 5), onComplete);
  }
  
}