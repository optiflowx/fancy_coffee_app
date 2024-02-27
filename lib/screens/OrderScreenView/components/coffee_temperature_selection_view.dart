import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/coffee_providers.dart';

class CoffeeTemperatureSelectionView extends ConsumerWidget {
  const CoffeeTemperatureSelectionView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> coffeeTemp = ['Hot \\ Warm', 'Cold \\ Ice'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        coffeeTemp.length,
        (index) {
          //PROP::
          final isSelected = ref.watch(currentTempProvider) == index;
          final width = MediaQuery.of(context).size.width;

          //BODY::
          return GestureDetector(
            onTap: () {
              ref.read(currentTempProvider.state).state = index;
            },
            child: AnimatedContainer(
              alignment: Alignment.center,
              width: (width / 2) - (width * 0.2),
              duration: const Duration(milliseconds: 500),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                border: Border.all(color: Colors.brown[400]!, width: 0.6),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: isSelected ? Colors.brown[400]! : Colors.transparent,
                    blurRadius: 6,
                    spreadRadius: 1.5,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  coffeeTemp[index],
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
