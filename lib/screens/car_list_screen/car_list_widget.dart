// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'dart:html';

import '../../common/widgets/buttons.dart';
import '../../common/widgets/icon_and_images.dart';
import '../../common/widgets/text_and_styles.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';

Widget carListAppBar(context) {
  return Stack(
    alignment: Alignment.center,
    children: [
      labels(
        text: cars,
        color: iconTextColor,
        size: 24.0,
        fontWeight: FontWeight.bold,
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: appBarIconButton(
          onPressed: () => Navigator.of(context).pop(context),
          bgColor: primaryYellow,
          borderColor: iconTextColor,
          child: icons(
            icon: Icons.arrow_back,
            color: iconTextColor,
          ),
        ),
      ),
    ],
  );
}
