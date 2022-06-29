
import '../../utils/colors.dart';
import 'padding_margin.dart';
import 'space_and_dividers.dart';
import 'text_and_styles.dart';

Widget logInButton({
  String ?text,
 textColor,
   backgroundColor,
  Function ?onPressed,
  bool ?isBorder,
   borderColor,
   buttonLogo,
  double topLeft = 10.0,
  double topRight = 10.0,
  double bottomLeft = 10.0,
  double bottomRight = 10.0,
}) {
  return Container(
    height: 48,
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft),
          topRight: Radius.circular(topRight),
          bottomLeft: Radius.circular(bottomLeft),
          bottomRight: Radius.circular(bottomRight)),
      border: isBorder
          ? Border.all(
              color: borderColor ?? color.black,
              style: BorderStyle.solid,
            )
          : Border.all(color: transparent),
    ),
    child: InkWell(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          labels(
            text: text,
            color: textColor,
            size: 16,
            fontWeight: FontWeight.w600,
          ),
          buttonLogo != null ? horizontalSpace(12.0) : Container(),
          buttonLogo ?? Container(),
        ],
      ),
    ),
  );
}

Widget appBarIconButton({
  Widget? child,
  Function? onPressed,
  Color bgColor,
  Color borderColor,
  double? size,
}) {
  assert(onPressed != null);
  return Container(
    height: size ?? 48,
    width: size ?? 48,
    decoration: BoxDecoration(
      color: bgColor ?? white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: borderColor ?? black),
    ),
    child: InkWell(
      onTap: onPressed,
      child: child,
    ),
  );
}

 submitButton({
  String? text, bgColor, textColor,

  Function ?onPressed,

  bool submit = false,
   EdgeInsets ?margin,
}) {
   assert(margin == null);
  return Container(
    height: 48,
    margin:
        margin ?? paddingOnly(left: 12.0, top: 12.0, right: 12.0, bottom: 24.0),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: InkWell(
      onTap: onPressed,
      child: Center(
        child: labels(
          text: text,
          color: textColor,
          size: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

Widget logoutNewFormButton({
  String? label,
  Function ?onTap,
   labelColor,
   bgColor,
}) {
  return Container(
    height: 48,
    margin: paddingAll(12.0),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: InkWell(
      onTap: onTap,
      child: Center(
        child: labels(
          text: label,
          size: 16,
          color: labelColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

Widget iconButton({  icon, Function ?onTap, Function? onPressed}) => iconButton(
    icon: icon,
    onPressed: onTap,
  );

