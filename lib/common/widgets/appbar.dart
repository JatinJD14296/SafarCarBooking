import '../../utils/screen_utils.dart';

appBarWidget({required double height, required Widget widget}) {
  return PreferredSize(
    preferredSize: Size(Screen.screenWidth, height: Screen.screenHeight * 0.3),
    child: widget,
  );
}



