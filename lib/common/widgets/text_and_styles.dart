
import 'dart:html';

Widget labels({
String? text,
  Color color,
  double? size,
  TextAlign textAlign,
  FontWeight fontWeight,
  TextOverflow overflow,
  int ? maxline,
  TextDecoration decoration,
}) {
  assert(maxline != null);
  return Text(
      text!,
      overflow: overflow ?? TextOverflow.ellipsis,
      maxLines: maxline ?? 1,
      style: defaultTextStyle(
        color: color,
        size: size ?? 14,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
      textAlign: textAlign ?? TextAlign.center,
    );
}

TextStyle defaultTextStyle({
  Color color,
  double? size,
  FontWeight fontWeight = FontWeight.normal,
  String? fontFamily,
  TextDecoration decoration=TextDecoration.none,
}) {
  return TextStyle(
      fontSize: size ,
      color: color,
      fontWeight: fontWeight ,
      fontFamily: fontFamily,
      decoration: decoration ,
    );
}
