import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../constants/values.dart';
import '../../models/coffee_model.dart';
import '../../providers/coffee_providers.dart';

class CoffeeHeader extends ConsumerWidget {
  final PageController textPageController;
  final double textPagePosition;

  const CoffeeHeader({
    required this.textPageController,
    required this.textPagePosition,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final currentIndex = ref.watch(currentIndexProvider).clamp(0, 11);
    final isHomePage = ref.watch(isHomePageProvider);

    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      height: 140,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          largeText(currentIndex, context),

          AnimatedSwitcher(
            duration: const Duration(milliseconds: 650),
            child: AnimatedScale(
              duration: const Duration(milliseconds: 800),
              scale: !isHomePage ? 1 : 0,
              child: Text(
                '\$${coffeeList[currentIndex].price}',
                key: Key('${coffeeList[currentIndex].price}'),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Helvetica Now',
                  color: Colors.grey,
                  fontSize: 26,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget largeText(int currentIndex, BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Flexible(
      child: PageView.builder(
        itemCount: coffeeList.length,
        controller: textPageController,
        itemBuilder: (context, index) {
          final double opacity = (textPagePosition + 1 - currentIndex).clamp(0, 1);
          return Opacity(
            opacity: opacity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.20),
              child: Text(
                coffeeList[currentIndex].name,
                key: Key(coffeeList[currentIndex].name),
                textAlign: TextAlign.center,
                maxLines: 2,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Helvetica Now',
                  fontSize: 35,
                ),
              ),
            ),
          );
        },
      ),
    );
    // return AnimatedSwitcher(
    //   duration: const Duration(milliseconds: 550),
    //   child: Padding(
    //     padding: EdgeInsets.symmetric(horizontal: width * 0.20),
    //     child: Text(
    //       coffeeList[currentIndex].name,
    //       key: Key(coffeeList[currentIndex].name),
    //       textAlign: TextAlign.center,
    //       maxLines: 2,
    //       style: const TextStyle(
    //         fontWeight: FontWeight.w700,
    //         fontFamily: 'Helvetica Now',
    //         fontSize: 35,
    //       ),
    //     ),
    //   ),
    // );
  }
}
