import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier
{
  int counter = 0;
  int round = 0;
  int totalcount = 0;

  Future<void> getLocalInfo() async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    counter = preferences.getInt('counter') ?? 0;
    round = preferences.getInt('round') ?? 0;
    totalcount = preferences.getInt('totalcount') ?? 0;
    notifyListeners();
  }

  void addition()
  {
    counter ++;
    totalCount();
    notifyListeners();
  }

  Future<void> savecounter (int count) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('counter', count);
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
    counterRound();
    notifyListeners();
  }
  void counterRound()
  {
   round = totalcount ~/ 108;
   print('---------------------- $round -------------------------');
    notifyListeners();
  }
}