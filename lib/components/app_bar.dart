import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/coffee_providers.dart';

PreferredSizeWidget appBar(
  BuildContext context,
  WidgetRef ref, {
  required Color iconColor,
  Color? backgroundColor,
}) {
  return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      leading: IconButton(
        iconSize: 32,
        color: iconColor,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        onPressed: () {
          if (ref.watch(isHomePageProvider) == false || ref.watch(isOrderProvider) == true) {
            Navigator.pop(context);

            if (ref.watch(isHomePageProvider) == true) {
              ref.watch(isHomePageProvider.state).state = false;
            } else {
              ref.watch(isHomePageProvider.state).state = true;
            }
            //
            // ref.read(isOrderProvider.state).state = false;
          }
        },
        icon: const Icon(CupertinoIcons.back),
      ),
      actions: [
        IconButton(
          iconSize: 32,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          color: iconColor,
          onPressed: () {},
          icon: const Icon(CupertinoIcons.bag_badge_plus),
        ),
      ]);
}
