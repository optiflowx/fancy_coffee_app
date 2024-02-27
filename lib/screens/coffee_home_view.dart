import 'package:fancy_coffee_app/providers/coffee_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../components/app_bar.dart';
import '../generated/assets.dart';
import '../models/coffee_model.dart';
import 'ScrollableCoffeeView/scrollable_coffee_view.dart';

class CoffeeHomeView extends ConsumerWidget {
  const CoffeeHomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final isHomePage = ref.watch(isHomePageProvider);
    double scale = isHomePage ? 1 : 0;
    double opacity = isHomePage ? 0.7 : 0;

    return Scaffold(
      appBar: appBar(context, ref,
          iconColor: Colors.white, backgroundColor: Colors.brown[300]),
      body: GestureDetector(
        onVerticalDragUpdate: (dragDetails) {
          if (dragDetails.primaryDelta! <= -1.5) {
            ref.read(isHomePageProvider.state).state = false;

            //
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 800),
                reverseTransitionDuration: const Duration(milliseconds: 800),
                pageBuilder: (context, animation, _) {
                  return FadeTransition(
                    opacity: animation,
                    child: const ScrollableCoffeeView(),
                  );
                },
              ),
            );
          }
        },
        child: Stack(
          children: [
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.brown[300]!, Colors.white],
                ),
              ),
            ),

            //Last COFFEE
            Positioned(
              height: height * 0.3,
              left: 0,
              right: 0,
              top: height * 0.12,
              child: AnimatedOpacity(
                opacity: opacity,
                duration: const Duration(milliseconds: 500),
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 500),
                  scale: scale,
                  child: Hero(
                    tag: coffeeList[3].name,
                    child: Image.asset(coffeeList[3].image),
                  ),
                ),
              ),
            ),

            //2nd of Last COFFEE
            Positioned(
              height: height * 0.4,
              left: 0,
              right: 0,
              top: height * 0.18,
              child: Opacity(
                opacity: 0.95,
                child: Hero(
                  tag: coffeeList[0].name,
                  child: Image.asset(coffeeList[0].image),
                ),
              ),
            ),

            //FIKA COFFEE
            Positioned(
              height: height * 0.635,
              left: 0,
              right: 0,
              bottom: 0,
              child: Hero(
                tag: coffeeList[1].name,
                child: Image.asset(
                  coffeeList[1].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            //FIKA COFFEE LOGO
            Positioned(
              height: 150,
              left: 0,
              right: 0,
              bottom: height * 0.27,
              child: Image.asset(Assets.imagesLogo),
            ),

            //BOTTOM COFFEE
            Positioned(
              height: height,
              left: 0,
              right: 0,
              bottom: -height * 0.75,
              child: Hero(
                tag: coffeeList[2].name,
                child: Image.asset(
                  coffeeList[2].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
