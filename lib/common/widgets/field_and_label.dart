import 'package:flutter/material.dart';
import 'package:safarcarbooking/common/widgets/padding_margin.dart';
import 'package:safarcarbooking/common/widgets/text_and_styles.dart';
import 'package:safarcarbooking/utils/colors.dart';

import '../../utils/colors.dart';
import 'padding_margin.dart';

class FieldAndLabel extends StatefulWidget {
  final Color labelTextColor;
  final TextStyle labelTextStyle;
  final Color fillColor;
  final String labelValue;
  final int maxLine;
  final bool isRequire;
  final Widget rightIcon;
  final Widget leftIcon;
  final bool isPassword;
  final bool readOnly;
  final EdgeInsetsGeometry padding;
  final String hint;
  final Function onEditingComplete;
  final Function onTap;
  final Function onChanged;
  final TextInputType inputType;
  final String validationMessage;
  final TextEditingController controller;

  FieldAndLabel({
    this.labelTextColor,
    this.isRequire = false,
    this.readOnly = false,
    this.fillColor,
    this.maxLine,
    this.labelTextStyle,
    this.padding,
    this.labelValue,
    this.onTap,
    this.onChanged,
    this.inputType,
    this.isPassword = false,
    this.onEditingComplete,
    this.hint,
    this.rightIcon,
    this.leftIcon,
    this.validationMessage,
    this.controller,
  });

  @override
  _FieldAndLabelState createState() => _FieldAndLabelState();
}

class _FieldAndLabelState extends State<FieldAndLabel> {
  var currentFieldValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.labelValue != null ? buildLabel(context) : Container(),
        buildTextField(context),
        buildValidationMessage(context),
      ],
    );
  }

  Widget buildLabel(BuildContext context) {
    return (widget.labelValue != null && widget.labelValue.isNotEmpty)
        ? Padding(
            padding: paddingOnly(left: 10),
            child: Row(children: <Widget>[
              Text(
                widget.labelValue,
                style: this.widget.labelTextStyle ??
                    defaultTextStyle(
                      color: widget.labelTextColor,
                      size: 14,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.start,
              ),
              if (widget.isRequire)
                Text(
                  "*",
                  style: defaultTextStyle(color: red, size: 14),
                  textAlign: TextAlign.start,
                ),
            ]),
          )
        : Container();
  }

  Widget buildTextField(BuildContext context) {
    return Container(
      margin: paddingAll(5.0),
      child: TextField(
        keyboardType: widget.inputType,
        obscureText: widget.isPassword ? visible : widget.isPassword,
        style: TextStyle(color: black),
        controller: widget.controller,
        onChanged: widget.onChanged,
        readOnly: widget.readOnly,
        onTap: widget.onTap,
        cursorColor: black,
        onSubmitted: (val) {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        maxLines: widget.maxLine ?? 1,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          suffixIcon: passVisibilityIcon(),
          prefixIcon: widget.leftIcon,
          counterText: "",
          hintText: widget.hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: primaryYellow),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: primaryYellow),
          ),
          filled: true,
          isDense: true,
          fillColor: widget.fillColor ?? white,
        ),
      ),
    );
  }

  bool visible = true;

  Widget passVisibilityIcon() => widget.rightIcon;

  Widget buildValidationMessage(BuildContext context) {
    return buildValidationErrorMessage(context,
        validationMessage: widget.validationMessage);
  }

  bool isBlank(String value) {
    return value == null || value == '';
  }

  Widget buildValidationErrorMessage(BuildContext context,
      {String ?validationMessage}) {
    return (!isBlank(validationMessage!))
        ? Padding(
            padding: paddingOnly(left: 20),
            child: Row(
              children: [
                Text(
                  validationMessage,
                  style: TextStyle(
                    fontSize: 13,
                    color: widget.validationMessage == "Valid"
                        ? Colors.green
                        : red,
                  ),
                ),
              ],
            ),
          )
        : Container();
  }
}
