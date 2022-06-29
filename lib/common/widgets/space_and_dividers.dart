import 'icon_and_images.dart';

horizontalSpace(double width) {
  return SizedBox(width: width);
}


 verticalSpace(double height) => SizedBox(height: height);

RoundedRectangleBorder roundedRectangleBorder({ double ?radius, BorderSide side}) {
  return RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius), side: side ?? BorderSide());
}



Widget divider({color, double?height, double? thickness}) =>
    divider(color: color, height: height, thickness: thickness);

Widget verticalDivider({ color, double? width, double? thickness}) =>
    verticalDivider(color: color, width: width, thickness: thickness);

Decoration circularBoxDecoration({
  Color containerColor,
  double? circularRadius,
  double? topLeftRadius,
  double? topRightRadius,
  double? bottomLeftRadius,
  double? bottomRightRadius,
  BoxBorder border,
  Gradient gradient,
  DecorationImage decorationImage,
  List<BoxShadow> boxShadow,
  BoxShape boxShape,
}) =>
    BoxDecoration(
      color: containerColor ?? white,
      gradient: gradient,
      image: decorationImage,
      boxShadow: boxShadow,
      shape: boxShape??BoxShape.rectangle,
      borderRadius: boxShape == null
          ? BorderRadius.only(
              topLeft: radius.circular(topLeftRadius ?? circularRadius ?? 0),
              topRight: Radius.circular(topRightRadius ?? circularRadius ?? 0),
              bottomLeft: Radius.circular(bottomLeftRadius ?? circularRadius ?? 0),
              bottomRight: Radius.circular(bottomRightRadius ?? circularRadius ?? 0),
            )
          : null,
      border: border,
    );

 gradientDivider({
  double? height,
  double ?width,
   begin,
  end,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.black, Colors.white],
        begin: begin,
        end: end,
      ),
    ),
  );
}

 gradientBoxWithIcon({
  double ?height,
  double ?width,
  begin,
   end,
   startColor,
   endColor,
  double? radius,
  String ?iconName,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      gradient: LinearGradient(
        colors: [startColor, endColor],
        begin: begin,
        end: end,
      ),
    ),
    child: Images.instance.assetImage(name: iconName),
  );
}
