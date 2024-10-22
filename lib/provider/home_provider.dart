import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier {
  int count = 0;
  int index = 0;
  int totalCount = 0;
  int malaCount = 0;

  void countAdd() {
    if (count == 108) {
      count = 0;
      malaCount++;
    }
    count++;
    totalCount++;
    notifyListeners();
  }

  void resetCount() {
    count = 0;
    notifyListeners();
  }

  // image
  void imageListRight() {
    if (index == 4) {
      index = 0;
    } else {
      index++;
    }
    notifyListeners();
  }

  void imageListLeft() {
    if (index == 0) {
      index = 4;
    } else {
      index--;
    }
    notifyListeners();
  }

  Future<void> set(int v1, v2, v3, v4) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt('count', v1);
    await sharedPreferences.setInt('totalCount', v2);
    await sharedPreferences.setInt('malaCount', v3);
    await sharedPreferences.setInt('index', v4);
  }

  HomeProvider(int countTemp, indexTemp, malaCountTemp, totalCountTemp) {
    count = countTemp;
    index = indexTemp;
    malaCount = malaCountTemp;
    totalCount = totalCountTemp;
    notifyListeners();
  }
}
