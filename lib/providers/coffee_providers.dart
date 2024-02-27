
import 'package:fancy_coffee_app/constants/values.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isDynamicIslandModeProvider = StateProvider.autoDispose<bool>((ref) => false);
final isIslandExpandedProvider = StateProvider.autoDispose((ref) => true);
final isIslandExpandedDelayedProvider = StateProvider.autoDispose((ref) => true);
final currentIndexProvider = StateProvider.autoDispose<int>((ref) => initialPageIndex);
final pagePositionProvider = StateProvider.autoDispose<double>((ref) => 0);
final isHomePageProvider = StateProvider.autoDispose((ref) => true);


//
final currentSizeProvider = StateProvider.autoDispose<int>((ref) => 0);
final currentTempProvider = StateProvider.autoDispose<int>((ref) => 0);
final isOrderProvider = StateProvider.autoDispose((ref) => false);
final coffeeScaleProvider = StateProvider.autoDispose<double>((ref) => 0.05);
