import 'package:flutter/material.dart';
import 'package:safarcarbooking/common/widgets/padding_margin.dart';
import 'package:safarcarbooking/common/widgets/text_and_styles.dart';
import 'package:safarcarbooking/utils/colors.dart';

Widget radioSelection({
  String value,
  String groupValue,
  Function onTap,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Radio(
        value: value,
        groupValue: groupValue,
        onChanged: onTap,
        activeColor: iconTextColor,
      ),
      labels(
        text: value,
        fontWeight: FontWeight.bold,
        size: 14.0,
        color: iconTextColor,
      ),
    ],
  );
}

Widget label(String text) => Padding(
  padding: paddingAll(10.0),
  child: labels(
    text: text,
    color: iconTextColor,
    size: 14,
    fontWeight: FontWeight.bold,
    textAlign: TextAlign.start,
  ),
);