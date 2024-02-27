import '../generated/assets.dart';

class Coffee {
  String name;
  String image;
  double price;

  Coffee({required this.image, required this.name, required this.price});
}

final List<Coffee> coffeeList = [

  Coffee(image: Assets.images11, name: 'Classic Irish Coffee', price: 2.90), //7
  Coffee(image: Assets.images8, name: 'Americano', price: 2.25), //8
  Coffee(image: Assets.images1, name: 'Caramel Macchiato', price: 3.43),
  Coffee(image: Assets.images9, name: 'Vietnamese-Style Iced Coffee', price: 2.57), //6
  Coffee(image: Assets.images2, name: 'Caramel Cold Drink', price: 2.46), //0
  Coffee(image: Assets.images3, name: 'Iced Coffee Mocha', price: 2.40), //1
  Coffee(image: Assets.images4, name: 'Caramelized Pecan Latte', price: 3.31), //2
  Coffee(image: Assets.images5, name: 'Toffee Nut Latte', price: 2.51), //3
  Coffee(image: Assets.images6, name: 'Cappuccino', price: 4.59), //4
  Coffee(image: Assets.images7, name: 'Toffee Nut Iced Latte', price: 3.55), //5
   // 9
  Coffee(image: Assets.images10, name: 'Black Tea Latte', price: 1.98), //10
  Coffee(image: Assets.images12, name: 'Toffee Nut Crunch Latte', price: 3.46), //11
];
