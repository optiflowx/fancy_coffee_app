import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/coffee_providers.dart';

// ignore: non_constant_identifier_names
Widget OrderButton({
  required Duration duration,
  required WidgetRef ref,
  required double rotation,
}) {
  return GestureDetector(
    onTap: () {
      ref.read(isDynamicIslandModeProvider.state).state = true;
    },
    child: AnimatedContainer(
      height: 50,
      width: 50,
      duration: duration,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateZ(rotation),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15,
            spreadRadius: 5,
          )
        ],
      ),
      child: const Icon(Icons.add, size: 38),
    ),
  );
}
