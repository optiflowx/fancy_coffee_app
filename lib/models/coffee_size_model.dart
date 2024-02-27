import '../generated/assets.dart';

class CoffeeSize {
  String label;
  String image;

  CoffeeSize({required this.image, required this.label});
}

final List<CoffeeSize> coffeeSize = [
  CoffeeSize(image: Assets.iconsSmall, label: 'S '), //7
  CoffeeSize(image: Assets.iconsMedium, label: 'M '), //8
  CoffeeSize(image: Assets.iconsLarge, label: 'L '),
];
