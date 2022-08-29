import 'package:flutter/material.dart';

class MyHomeProvider extends ChangeNotifier{
  String _message = 'Enter your age to check';
  bool _isAdult = false;

  String get message => _message;

  bool get isAdult => _isAdult;
  
  void checkAge(int age){
    if(age >= 18 && age <= 30){
      young();
    }
    else if(age > 30){
      adult();
    }
    else{
      notAdult();
    }
  }

  void young() {
    _message = 'You are young';
    _isAdult = true;
    notifyListeners();
  }

  void adult(){
    _message = 'You are Adult';
    _isAdult = true;
    notifyListeners();
  }

  void notAdult() {
    _message = 'You are under 18';
    _isAdult = false;
    notifyListeners();
  }
}