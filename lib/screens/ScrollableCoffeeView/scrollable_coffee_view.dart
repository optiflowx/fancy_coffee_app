import 'package:animate_do/animate_do.dart';
import 'package:fancy_coffee_app/models/coffee_model.dart';
import 'package:fancy_coffee_app/providers/coffee_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../components/app_bar.dart';
import 'coffee_header.dart';
import 'coffee_item_shadow.dart';
import 'coffee_page_view.dart';
import 'fade_in_menu_button.dart';
import '../../constants/values.dart';

class ScrollableCoffeeView extends ConsumerStatefulWidget {
  const ScrollableCoffeeView({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _ScrollableCoffeeViewState();
}

class _ScrollableCoffeeViewState extends ConsumerState {
  //CONTROLLERS::
  final pageController =
      PageController(initialPage: initialPageIndex, viewportFraction: .35);
  final textPageController = PageController(initialPage: initialPageIndex);

  //MUTABLE VARIABLES
  double pagePosition = initialPageIndex.toDouble();
  double textPagePosition = initialPageIndex.toDouble();

  //FUNCTIONS
  void onCoffeeChanged() {
    setState(() => pagePosition = pageController.page!);
  }

  void onTextChanged() {
    setState(() => textPagePosition = textPageController.page!);
  }

  //onInit
  @override
  void initState() {
    pageController.addListener(onCoffeeChanged);
    textPageController.addListener(onTextChanged);
    super.initState();
  }

  //Disposables
  @override
  void dispose() {
    pageController.removeListener(onCoffeeChanged);
    pageController.dispose();

    textPageController.removeListener(onTextChanged);
    textPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context, ref,
          iconColor: Colors.black, backgroundColor: Colors.white),
      body: SafeArea(
        child: Stack(
          children: [
            //CoffeeHeader
            CoffeeHeader(
              textPageController: textPageController,
              textPagePosition: textPagePosition,
            ),

            //Coffee Scroll/Page View
            CoffeePageView(
              pageController: pageController,
              pagePosition: pagePosition,
              textPageController: textPageController,
            ),

            //Bottom Shadow
            CoffeeItemShadow(),

            //Menu Button
            FadeInMenuButton()
          ],
        ),
      ),
    );
  }
}
