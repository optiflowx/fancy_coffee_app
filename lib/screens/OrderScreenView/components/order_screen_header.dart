import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../models/coffee_model.dart';

class OrderScreenHeader extends StatelessWidget {
  final String name;

  const OrderScreenHeader({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.20),
        child: Text(
          name,
          key: Key(name),
          textAlign: TextAlign.center,
          maxLines: 2,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: 'Helvetica Now',
            fontSize: 34,
          ),
        ),
      ),
    );
  }
}
