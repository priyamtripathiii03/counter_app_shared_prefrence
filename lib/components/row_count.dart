import 'package:flutter/material.dart';
import 'box_count_method.dart';

Row rowCountBox({required String title, text1, text2, required bool isX}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
      const SizedBox(
        width: 5,
      ),
      boxCountMethod(text: text1),
      const SizedBox(
        width: 5,
      ),
      (isX)
          ? const Text(
        'x',
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      )
          : const Padding(padding: EdgeInsets.zero),
      const SizedBox(
        width: 5,
      ),
      (isX)
          ? boxCountMethod(text: text2)
          : const Padding(padding: EdgeInsets.zero),
    ],
  );
}
