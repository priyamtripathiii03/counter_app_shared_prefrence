import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier
{
  int counter =0;

  void addition()
  {
    counter ++;
    notifyListeners();
  }
  void decrement()
  {
    counter--;
    notifyListeners();
  }
  void reset()
  {
    counter = 0;
    notifyListeners();
  }
}