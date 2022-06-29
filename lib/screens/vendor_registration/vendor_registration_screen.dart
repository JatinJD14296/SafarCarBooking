
import 'dart:html';

import '../../common/validation/validation_stream_controller.dart';
import '../../common/widgets/buttons.dart';
import '../../common/widgets/field_and_label.dart';
import '../../common/widgets/icon_and_images.dart';
import '../../common/widgets/padding_margin.dart';
import '../../common/widgets/space_and_dividers.dart';
import '../../common/widgets/text_and_styles.dart';
import '../../models/vendor_model.dart';
import '../../network/firestore_instance.dart';
import '../../utils/colors.dart';
import '../../utils/screen_utils.dart';
import '../../utils/strings.dart';

class VendorRegistration extends StatefulWidget {
  @override
  _VendorRegistrationState createState() => _VendorRegistrationState();
}


class _VendorRegistrationState extends State<VendorRegistration> {
  final TextEditingController firmNameController = TextEditingController();
  final TextEditingController vendorNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController gstController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String errFirmName = "";
  String errVendorName = "";
  String errMobile = "";
  String errEmail = "";
  String errAddress = "";
  String errPassword = "";
  String errConfirmPassword = "";

  bool passVisible = true;
  bool confirmPassVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryYellow,
      body: Padding(
        padding: paddingAll(10.0),
        child: ListView(
          children: [
            Container(
              height: 48,
              child: Stack(
                children: [
                  appBarIconButton(
                    child: icons(icon: Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                    borderColor: iconTextColor,
                    bgColor: white,
                  ),
                  Center(
                    child: labels(
                      text: registration,
                      size: 24.0,
                      color: iconTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(20.0),
            FieldAndLabel(
              controller: firmNameController,
              labelValue: firm_name,
              hint: enter_firm_name,
              isRequire: true,
              inputType: TextInputType.text,
              leftIcon: icons(icon: Icons.business),
              validationMessage: errFirmName,
              onChanged: (value) {
                setState(() {
                  errFirmName = firmValidationMsg(value);
                });
              },
            ),
            verticalSpace(15.0),
            FieldAndLabel(
              controller: vendorNameController,
              labelValue: vendor_name,
              hint: enter_vendor_name,
              isRequire: true,
              inputType: TextInputType.text,
              leftIcon: icons(icon: Icons.person),
              validationMessage: errVendorName,
              onChanged: (value) {
                setState(() {
                  errVendorName = vendorValidationMsg(value);
                });
              },
            ),
            verticalSpace(15.0),
            FieldAndLabel(
              controller: mobileController,
              labelValue: mobile,
              hint: enter_mobile,
              isRequire: true,
              inputType: TextInputType.phone,
              leftIcon: icons(icon: Icons.phone),
              validationMessage: errMobile,
              onChanged: (value) {
                setState(() {
                  errMobile = mobileValidationMsg(value);
                });
              },
            ),
            verticalSpace(15.0),
            FieldAndLabel(
              controller: emailController,
              labelValue: email,
              hint: enter_email,
              isRequire: true,
              inputType: TextInputType.emailAddress,
              leftIcon: icons(icon: Icons.email),
              validationMessage: errEmail,
              onChanged: (value) {
                setState(() {
                  errEmail = emailValidationMsg(value);
                });
              },
            ),
            verticalSpace(15.0),
            FieldAndLabel(
              controller: gstController,
              labelValue: gst,
              hint: enter_gst,
              isRequire: false,
              inputType: TextInputType.text,
              leftIcon: icons(icon: Icons.card_travel),
            ),
            verticalSpace(15.0),
            FieldAndLabel(
              controller: addressController,
              labelValue: address,
              hint: enter_address,
              isRequire: true,
              inputType: TextInputType.text,
              maxLine: 3,
              leftIcon: icons(icon: Icons.room),
              validationMessage: errAddress,
              onChanged: (value) {
                setState(() {
                  errAddress = addressValidationMsg(value);
                });
              },
            ),
            verticalSpace(15.0),
            FieldAndLabel(
              labelValue: password,
              hint: enter_password,
              labelTextColor: iconTextColor,
              isPassword: passVisible,
              controller: passwordController,
              fillColor: white,
              isRequire: true,
              validationMessage: errPassword,
              onChanged: (value) {
                setState(() {
                  errPassword = passwordValidationMsg(value);
                });
              },
              rightIcon: iconButton(
                onTap: () {
                  setState(() {
                    passVisible = !passVisible;
                  });
                },
                icon: icons(
                  icon: passVisible ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            verticalSpace(15.0),
            FieldAndLabel(
              labelValue: confirm_password,
              hint: enter_confirm_password,
              labelTextColor: iconTextColor,
              isPassword: confirmPassVisible,
              controller: confirmPasswordController,
              isRequire: true,
              fillColor: white,
              validationMessage: errConfirmPassword,
              onChanged: (value) {
                setState(() {
                  errConfirmPassword = confirmPasswordValidationMsg(
                    value,
                    passwordController.text,
                  );
                });
              },
              rightIcon: iconButton(
                onTap: () {
                  setState(() {
                    confirmPassVisible = !confirmPassVisible;
                  });
                },
                icon: icons(
                  icon: confirmPassVisible
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              ),
            ),
            verticalSpace(25.0),
            submitButton(
                text: submit,
                bgColor: iconTextColor,
                textColor: white,
                margin: paddingSymmetric(horizontal: Screen.screenWidth * 0.2),
                onPressed: () {

                  print("===== ${errFirmName == "" &&
                      errVendorName == "" &&
                      errMobile == "" &&
                      errEmail == "" &&
                      errAddress == "" &&
                      errPassword == "" &&
                      errConfirmPassword == "" &&
                      firmNameController.text.isNotEmpty &&
                      vendorNameController.text.isNotEmpty &&
                      mobileController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      addressController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty &&
                      confirmPasswordController.text.isNotEmpty}");
                  setState(() {
                    errFirmName = firmValidationMsg(firmNameController.text);
                    errVendorName =
                        vendorValidationMsg(vendorNameController.text);
                    errMobile = mobileValidationMsg(mobileController.text);
                    errEmail = emailValidationMsg(emailController.text);
                    errAddress = addressValidationMsg(addressController.text);
                    errPassword =
                        passwordValidationMsg(passwordController.text);
                    errConfirmPassword = confirmPasswordValidationMsg(
                      confirmPasswordController.text,
                      passwordController.text,
                    );
                  });
                  if (errFirmName == "" &&
                      errVendorName == "" &&
                      errMobile == "" &&
                      errEmail == "" &&
                      errAddress == "" &&
                      errPassword == "" &&
                      errConfirmPassword == "" &&
                      firmNameController.text.isNotEmpty &&
                      vendorNameController.text.isNotEmpty &&
                      mobileController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      addressController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty &&
                      confirmPasswordController.text.isNotEmpty) {
                    String key =
                        FireBaseDatabaseInstance.vendorDatabase.push().key;
                    FireBaseDatabaseInstance.vendorDatabase
                        .child(key)
                        .set(VendorDataModel(
                          firmName: firmNameController.text,
                          vendorName: vendorNameController.text,
                          email: emailController.text,
                          address: addressController.text,
                          gst: gstController.text??"",
                          mobileNumber: mobileController.text,
                          password: passwordController.text,
                          key: key,
                        ).toMap())
                        .then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: labels(
                            text: vendor_registered_successFully,
                            color: white,
                          ),
                        ),
                      );
                      Navigator.of(context).pop(context);
                    });
                  }
                }),
            verticalSpace(25.0),
          ],
        ),
      ),
    );
  }
}
