import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/coffee_size_model.dart';
import '../../../providers/coffee_providers.dart';

class CoffeeSizeSelectionView extends ConsumerWidget {
  const CoffeeSizeSelectionView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        coffeeSize.length,
        (index) {
          //PROP::
          final isSelected = ref.watch(currentSizeProvider) == index;

          //BODY::
          return GestureDetector(
            onTap: () {
              ref.read(currentSizeProvider.state).state = index;

              if (index == 0) {
                ref.read(coffeeScaleProvider.state).state = 0.05;
              } else if( index == 1) {
                ref.read(coffeeScaleProvider.state).state = 0.10;
              } else {
                ref.read(coffeeScaleProvider.state).state = 0.15;
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  coffeeSize[index].image,
                  width: 50,
                  fit: BoxFit.contain,
                  color: isSelected ? Colors.brown[400] : Colors.grey,
                ),
                const SizedBox(height: 10),
                Text(
                  coffeeSize[index].label,
                  style: TextStyle(
                    color: isSelected ? Colors.brown[400] : Colors.grey,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
