import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../components/app_bar.dart';
import 'order_button.dart';
import '../../providers/coffee_providers.dart';
import '../../widgets/DyamicIsland/dynamic_island.dart';
import 'components/coffee_size_selection_view.dart';
import 'components/coffee_temperature_selection_view.dart';
import 'components/order_screen_header.dart';
import 'components/shadow_view.dart';

class OrderScreenView extends ConsumerWidget {
  final String image, name;
  final double price;

  const OrderScreenView(
      {super.key,
      required this.image,
      required this.name,
      required this.price});

  @override
  Widget build(context, ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final isOrder = ref.watch(isOrderProvider);
    final isDynamicIsland = ref.watch(isDynamicIslandModeProvider);
    const duration = Duration(milliseconds: 600);
    final size = ref.watch(coffeeScaleProvider);
    final scale = size == 0.05
        ? 0.35
        : size == 0.1
            ? 0.3
            : 0.25;
    final double rotation = isOrder ? 0 : 45;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar(context, ref,
              iconColor: Colors.black, backgroundColor: Colors.white),
          body: Stack(
            children: [
              //CoffeeHeader
              OrderScreenHeader(name: name),

              shadowView(
                duration: duration,
                isOrder: isOrder,
                width: width,
                height: height,
              ),

              //Image
              AnimatedPositioned(
                top: height * 0.2,
                left: 0,
                right: 0,
                bottom: height * scale,
                curve: Curves.easeInOutBack,
                duration: const Duration(milliseconds: 500),
                child: Hero(
                  tag: image,
                  child: Image.asset(image),
                ),
              ),

              //Price
              AnimatedPositioned(
                bottom: isOrder ? width * 0.625 : width * 0.3,
                left: isOrder ? width * 0.15 : -100,
                duration: duration,
                curve: Curves.easeInOutBack,
                child: Text(
                  '\$$price',
                  style: TextStyle(
                    color: Colors.brown[400],
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Helvetica Now',
                  ),
                ),
              ),

              //OrderButton
              AnimatedPositioned(
                top: isOrder ? height * 0.125 : height * 0.05,
                right: isOrder ? width * 0.15 : -100,
                duration: duration,
                child: OrderButton(
                    duration: duration, ref: ref, rotation: rotation),
              ),

              //SelectionViews
              AnimatedPositioned(
                bottom: isOrder
                    ? (MediaQuery.of(context).padding.bottom + 10)
                    : -250,
                left: isOrder ? width * 0.17 : 0,
                right: isOrder ? width * 0.17 : 0,
                duration: duration,
                child: AnimatedOpacity(
                  opacity: isOrder ? 1 : 0,
                  duration: duration,
                  child: Column(
                    children: const [
                      CoffeeSizeSelectionView(),
                      SizedBox(height: 30),
                      CoffeeTemperatureSelectionView()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        //DynamicIsland
        if (isDynamicIsland)
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: BounceInUp(
              child: const DynamicIsland(),
            ),
          ),
      ],
    );
  }
}
