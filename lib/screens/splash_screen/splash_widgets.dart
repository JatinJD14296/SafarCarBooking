import 'package:flutter/cupertino.dart';
import 'package:safarcarbooking/common/widgets/icon_and_images.dart';
import '../../utils/images.dart';

Widget splashScreenWidget(Animation<double> animation) => Center(
      child: FadeTransition(
        opacity: animation,
        child: Center(
          child: Images.instance.assetImage(name: app_logo),
        ),
      ),
    );
