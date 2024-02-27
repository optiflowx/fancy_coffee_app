import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/coffee_providers.dart';

class FadeInMenuButton extends ConsumerStatefulWidget {
  const FadeInMenuButton({super.key});

  @override
  ConsumerState createState() => _FadeInMenuButtonState();
}

/// FadeState class
/// The animation magic happens here
class _FadeInMenuButtonState extends ConsumerState
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  late Animation<double> animation;
  late Animation<double> opacity;

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    animation = Tween<double>(begin: 550, end: 0).animate(
      CurvedAnimation(parent: controller!, curve: Curves.easeInOut),
    );

    opacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller!, curve: const Interval(0, 0.65)));

    controller?.forward();
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(currentIndexProvider);
    final double opacity = ((currentIndex == 0 && !currentIndex.isOdd)) ? 1 : 0;

    return AnimatedBuilder(
      animation: controller!,
      builder: (BuildContext context, Widget? child) {
        return Positioned(
          bottom: 80,
          right: 30,
          child: Transform.translate(
            offset: Offset(-animation.value, animation.value),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedOpacity(
                  opacity: opacity,
                  duration: const Duration(milliseconds: 550),
                  child: Text('Menu',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
                SizedBox(width: 12),
                Icon(CupertinoIcons.arrow_right, size: 35, color: Colors.white),
              ],
            ),
          ),
        );
      },
    );
  }
}
