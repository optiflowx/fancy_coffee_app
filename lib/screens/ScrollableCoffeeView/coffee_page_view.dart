import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../constants/values.dart';
import '../../models/coffee_model.dart';
import '../../providers/coffee_providers.dart';
import '../OrderScreenView/order_screen_view.dart';

class CoffeePageView extends ConsumerWidget {
  const CoffeePageView({
    required this.textPageController,
    required this.pageController,
    required this.pagePosition,
    super.key,
  });

  final PageController textPageController;
  final PageController pageController;
  final double pagePosition;

  @override
  Widget build(context, ref) {
    final height =
        MediaQuery.of(context).size.height; //This 60 is of the appBar

    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: coffeeList.length + 1,
      controller: pageController,
      onPageChanged: (index) {
        ref.read(currentIndexProvider.state).state = index;

        textPageController.animateToPage(index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut);
      },
      itemBuilder: (context, i) {
        if (i == 0) {
          return const SizedBox.shrink();
        }

        final index = i - 1;
        final result = (pagePosition - i) + 1;
        final viewPercent = -0.45 * result;

        double opacity = (viewPercent + 1.5).clamp(0, 1);

        // We add the 1 so that the sizedBox space is covered.
        double scale = -0.25 * result + 1;

        final translate = (height * 0.285) * viewPercent.abs();

        return GestureDetector(
          onTap: () {
            Future.delayed(const Duration(milliseconds: 500),
                () => ref.read(isOrderProvider.state).state = true);
            //Then
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 700),
                reverseTransitionDuration: const Duration(milliseconds: 700),
                pageBuilder: (context, animation, _) {
                  return FadeTransition(
                    opacity: animation,
                    child: OrderScreenView(
                      image: coffeeList[index].image,
                      name: coffeeList[index].name,
                      price: coffeeList[index].price,
                    ),
                  );
                },
              ),
            );
          },
          child: Transform.scale(
            scale: 1.5, //Scales the item, this scale is final
            origin: const Offset(0, 50), //Bottom Padding of the item
            alignment: Alignment.bottomCenter,
            child: Transform(
              alignment: Alignment.topCenter,
              transform: Matrix4.identity()
                ..translate(0.0, translate)
                ..setEntry(3, 2, 50)
                ..scale(scale),
              child: Opacity(
                opacity: opacity,
                child: Hero(
                  tag: coffeeList[index].name,
                  child: Image.asset(
                    coffeeList[index].image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
