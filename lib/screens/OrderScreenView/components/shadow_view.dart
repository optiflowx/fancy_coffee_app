import 'package:flutter/material.dart';

Widget shadowView(
    {required Duration duration,
    required bool isOrder,
    required double width,
    required double height}) {
  return Positioned(
    left: width * 0.35,
    right: width * 0.35,
    bottom: height * 0.34,
    child: AnimatedContainer(
      duration: duration,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(350),
        boxShadow: [
          BoxShadow(
            color: Colors.brown[300]!,
            spreadRadius: isOrder ? 50 : 0,
            blurRadius: isOrder ? 50 : 0,
          )
        ],
      ),
    ),
  );
}
