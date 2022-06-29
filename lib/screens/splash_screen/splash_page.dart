

import 'dart:html';
import 'dart:js';

import '../../utils/colors.dart';
import '../../utils/navigator_route.dart';
import '../../utils/strings.dart';
import 'splash_widgets.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();

    Future.delayed(
      Duration(seconds: 5),
      () async {
        SharedPreferences pref = await SharedPreferences.getInstance();
        String status = pref.getString(login);
        Navigator.pushReplacementNamed(
          context,
          status == login ? dashboardScreen : loginScreen,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: splashScreenWidget(animation),
    );
  }
}
