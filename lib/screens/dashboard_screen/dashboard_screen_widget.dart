import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/widgets/buttons.dart';
import '../../common/widgets/icon_and_images.dart';
import '../../common/widgets/text_and_styles.dart';
import '../../utils/colors.dart';
import '../../utils/navigator_route.dart';
import '../../utils/strings.dart';
import '../../utils/strings.dart';

Widget dashboardAppBar(context) {
  return Stack(
    alignment: Alignment.center,
    children: [
      labels(
        text: vendor,
        color: iconTextColor,
        size: 24.0,
        fontWeight: FontWeight.bold,
      ),
      Align(
        alignment: Alignment.centerRight,
        child: appBarIconButton(
          onPressed: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.setString(login, logout);
            Navigator.pushReplacementNamed(context, loginScreen);
          },
          bgColor: primaryYellow,
          borderColor: iconTextColor,
          child: icons(
            icon: Icons.exit_to_app,
            color: iconTextColor,
          ),
        ),
      ),
    ],
  );
}
