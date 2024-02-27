import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../generated/assets.dart';
import '../../providers/coffee_providers.dart';

class DynamicIsland extends ConsumerWidget {
  const DynamicIsland({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //PROPERTIES::
    final isExpanded = ref.watch(isIslandExpandedProvider);
    final isExpandedDelayed = ref.watch(isIslandExpandedDelayedProvider);
    const double width = 420;
    final double height = isExpanded ? 250 : 40;
    final double hPadding = isExpanded ? 15 : 100;
    final double padding = isExpandedDelayed ? 0 : 25;
    final double bRadius = isExpanded ? 50 : 24;
    final Curve curve = isExpanded ? Curves.easeOutBack : Curves.easeInBack;

    //BODY::
    return GestureDetector(
      // onTap: () => ref.read(isIslandExpandedDelayedProvider.state).state =
      //     !ref.read(isIslandExpandedDelayedProvider.state).state,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          AnimatedPadding(
            duration: const Duration(milliseconds: 800),
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: AnimatedContainer(
              height: height,
              width: width,
              curve: curve,
              duration: const Duration(milliseconds: 800),
              margin: EdgeInsets.only(top: 10, left: hPadding, right: hPadding),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(bRadius),
                color: Colors.black,
              ),
              child: Stack(
                children: [
                  _coffeeImage(ref),
                  //Coffee Name
                  _coffeeName(ref),
                  //Delivery Time Text
                  if (!ref.watch(isIslandExpandedProvider))
                    _deliveryTimeSmall(ref),
                  _deliveryTimeMedium(ref),
                  //Price
                  _coffeePrice(ref),
                  //Large Order Button
                  _animatedOrderButton(ref)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _coffeeName(WidgetRef ref) {
    final isExpanded = ref.watch(isIslandExpandedProvider);
    final opacity = isExpanded ? 1.0 : 0.0;

    return Positioned(
      top: 55,
      left: 110,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 550),
        scale: opacity,
        curve: Curves.easeInOut,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: opacity,
          child: const Text(
            'Caramel Macchiato',
            style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                fontFamily: 'Helvetica Now',
                decoration: TextDecoration.none),
          ),
        ),
      ),
    );
  }

  Widget _coffeePrice(WidgetRef ref) {
    final isExpanded = ref.watch(isIslandExpandedProvider);
    final opacity = isExpanded ? 1.0 : 0.0;

    return Positioned(
      top: 110,
      right: 20,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: opacity,
        child: Text(
          '\$7.99',
          style: TextStyle(
              color: Colors.brown[300]!,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'Helvetica Now',
              decoration: TextDecoration.none),
        ),
      ),
    );
  }

  Widget _coffeeImage(WidgetRef ref) {
    //STATE::
    final isExpanded = ref.watch(isIslandExpandedProvider);

    //PROPERTIES::
    final double leftPos = isExpanded ? 20 : 0;
    final double topPos = isExpanded ? 45 : 0;
    final double height = isExpanded ? 80 : 30;
    final double width = isExpanded ? 80 : 30;
    final double radius = isExpanded ? 10 : 25;
    final double padding = isExpanded ? 10 : 5;

    //BODY::
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 900),
      top: topPos,
      left: leftPos,
      curve: Curves.easeInOut,
      child: AnimatedContainer(
        height: height,
        width: width,
        padding: EdgeInsets.all(padding),
        duration: const Duration(milliseconds: 600),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: Colors.white,
        ),
        child: Image.asset(Assets.images1, fit: BoxFit.contain),
      ),
    );
  }

  Widget _deliveryTimeSmall(WidgetRef ref) {
    return Positioned(
        top: 2.5,
        right: 10,
        child: FadeIn(
          delay: const Duration(milliseconds: 600),
          child: const Text(
            '20 min',
            key: Key('20'),
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: 'Helvetica Now',
              decoration: TextDecoration.none,
            ),
          ),
        ));
  }

  Widget _deliveryTimeMedium(WidgetRef ref) {
    return Positioned(
        top: 90,
        left: 110,
        child: FadeIn(
          delay: const Duration(milliseconds: 300),
          child: const Text(
            '20 min',
            key: Key('20'),
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'Helvetica Now',
              decoration: TextDecoration.none,
            ),
          ),
        ));
  }

  ///[This Button Animates to a pill onCollapse of the D.Island].
  Widget _animatedOrderButton(WidgetRef ref) {
    //STATE::
    final isExpanded = ref.watch(isIslandExpandedProvider);

    //PROPERTIES::
    final double? leftPos = isExpanded ? 20 : null;
    final double bottomPos = isExpanded ? 20 : 3;
    final double rightPos = isExpanded ? 20 : 8;
    final double width =
        isExpanded ? 250 : 45; //Animated the pill from 250 to 45.
    final double height = isExpanded ? 55 : 5; //Animated the pill from 55 to 6.

    //BODY::
    return AnimatedPositioned(
      bottom: bottomPos,
      left: leftPos,
      right: rightPos,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOutBack,
      child: GestureDetector(
        onTap: () async {
          ref.read(isIslandExpandedProvider.state).state = false;
        },
        child: AnimatedContainer(
          height: height,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.brown[400],
            borderRadius: BorderRadius.circular(35),
          ),
          duration: const Duration(milliseconds: 600),
          child: isExpanded
              ? const Text(
                  'Order Now',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Helvetica Now',
                      decoration: TextDecoration.none),
                )
              : null,
        ),
      ),
    );
  }
}
