import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier
{
  int counter = 0;
  int round = 0;
  int totalcount = 0;

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
  void totalCount()
  {
    totalcount++;
    notifyListeners();
  }
  void counterRound()
  {
    if(counter>=108)
    {
      round++;
    }
    notifyListeners();
  }
}