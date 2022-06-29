

import 'validation_string.dart';


String emailValidationMsg(String email) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp('pattern');
  if (email.isEmpty) {
    return error_required_email;
  } else if (regex.hasMatch(email)) {
    return error_valid;
  } else
    return error_valid_email;
}

String passwordValidationMsg(String password) {
  if (password.isEmpty || password == "")
    return error_required_password;
  else if (password.length < 6)
    return error_minimum_6_character;
  else
    return "";
}

String firmValidationMsg(String firm) =>
    firm.isEmpty || firm == "" ? error_required_firm : "";

String vendorValidationMsg(String vendor) =>
    vendor.isEmpty || vendor == "" ? error_required_vendor : "";

String driverNameValidationMsg(String value) =>
    value.isEmpty || value == "" ? error_required_driver_name : "";

String licenceNumberValidationMsg(String value) =>
    value.isEmpty || value == "" ? error_required_licence_number : "";

String carTypeValidationMsg(String value) =>
    value.isEmpty || value == "" ? error_required_car_type : "";

String carBrandValidationMsg(String value) =>
    value.isEmpty || value == "" ? error_required_car_brand : "";

String carValidationMsg(String value) =>
    value.isEmpty || value == "" ? error_required_car : "";

String seatingCapacityValidationMsg(String value) =>
    value.isEmpty || value == "" ? error_required_seating_capacity : "";

String mobileValidationMsg(String mobile) {
  if (mobile.isEmpty || mobile == "")
    return error_required_mobile_number;
  else if (mobile.length < 10 || mobile.length > 10)
    return error_valid_mobile_number;
  else
    return "";
}

String addressValidationMsg(String address) =>
    address.isEmpty || address == "" ? error_required_address : "";

String confirmPasswordValidationMsg(String confirmPassword, String password) {
  if (confirmPassword.isEmpty || confirmPassword == "")
    return error_required_confirm_password;
  else if (confirmPassword != password)
    return error_password_confirm_must_be_valid;
  else
    return "";
}
