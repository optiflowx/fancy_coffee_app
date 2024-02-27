import 'package:flutter/material.dart';

class CoffeeItemShadow extends StatelessWidget {
  const CoffeeItemShadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 75,
        right: 75,
        bottom: 0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(350),
            boxShadow: [
              BoxShadow(
                color: Colors.brown.shade400,
                spreadRadius: 70,
                blurRadius: 70,
              )
            ],
          ),
        ),
    );
  }
}
