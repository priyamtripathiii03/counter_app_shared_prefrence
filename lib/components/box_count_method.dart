import 'package:flutter/material.dart';

Container boxCountMethod({required String text}) {
  return Container(
    alignment: Alignment.center,
    height: 30,
    width: 75,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(50),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    ),
  );
}