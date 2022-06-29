import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safarcarbooking/models/car_model.dart';
import 'package:safarcarbooking/models/vendor_model.dart';
import 'package:safarcarbooking/network/firestore_instance.dart';
import 'package:safarcarbooking/screens/car_registration/car_registration_widgets.dart';
import '../../common/validation/validation_stream_controller.dart';
import '../../common/widgets/buttons.dart';
import '../../common/widgets/field_and_label.dart';
import '../../common/widgets/icon_and_images.dart';
import '../../common/widgets/padding_margin.dart';
import '../../common/widgets/space_and_dividers.dart';
import '../../common/widgets/text_and_styles.dart';
import '../../utils/colors.dart';
import '../../utils/screen_utils.dart';
import '../../utils/strings.dart';
import 'car_registration_widgets.dart';

class CarRegistration extends StatefulWidget {
  final VendorDataModel vendor;

  CarRegistration(this.vendor);

  @override
  _CarRegistrationState createState() => _CarRegistrationState();
}

class _CarRegistrationState extends State<CarRegistration> {
  final TextEditingController driverNameController = TextEditingController();
  final TextEditingController licenceNumberController = TextEditingController();
  final TextEditingController carTypeController = TextEditingController();
  final TextEditingController carBrandController = TextEditingController();
  final TextEditingController carController = TextEditingController();
  final TextEditingController seatingCapacityController =
      TextEditingController();

  String acNonAc = ac;
  String petroleum = diesel;

  String errDriverName = "";
  String errLicenceNumber = "";
  String errCarType = "";
  String errCarBrand = "";
  String errCar = "";
  String errSeatingCapacity = "";

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
              controller: driverNameController,
              labelValue: driver_name,
              hint: enter_driver_name,
              isRequire: true,
              inputType: TextInputType.text,
              validationMessage: errDriverName,
              onChanged: (value) {
                setState(() {
                  errDriverName = driverNameValidationMsg(value);
                });
              },
            ),
            verticalSpace(15.0),
            FieldAndLabel(
              controller: licenceNumberController,
              labelValue: licence_number,
              hint: enter_licence_number,
              isRequire: true,
              inputType: TextInputType.text,
              validationMessage: errLicenceNumber,
              onChanged: (value) {
                setState(() {
                  errLicenceNumber = licenceNumberValidationMsg(value);
                });
              },
            ),
            verticalSpace(15.0),
            FieldAndLabel(
              controller: carTypeController,
              labelValue: car_type,
              hint: enter_car_type,
              isRequire: true,
              inputType: TextInputType.text,
              validationMessage: errCarType,
              onChanged: (value) {
                setState(() {
                  errCarType = carTypeValidationMsg(value);
                });
              },
            ),
            verticalSpace(15.0),
            FieldAndLabel(
              controller: carBrandController,
              labelValue: car_brand,
              hint: enter_car_brand,
              isRequire: true,
              inputType: TextInputType.text,
              validationMessage: errCarBrand,
              onChanged: (value) {
                setState(() {
                  errCarBrand = carBrandValidationMsg(value);
                });
              },
            ),
            verticalSpace(15.0),
            FieldAndLabel(
              controller: carController,
              labelValue: car,
              hint: enter_car,
              isRequire: true,
              inputType: TextInputType.text,
              validationMessage: errCar,
              onChanged: (value) {
                setState(() {
                  errCar = carValidationMsg(value);
                });
              },
            ),
            verticalSpace(15.0),
            label(acOrNonAc),
            Row(
              children: [
                radioSelection(
                  value: ac,
                  groupValue: acNonAc,
                  onTap: (val) {
                    setState(() {
                      acNonAc = val;
                    });
                  },
                ),
                horizontalSpace(10.0),
                radioSelection(
                  value: non_ac,
                  groupValue: acNonAc,
                  onTap: (val) {
                    setState(() {
                      acNonAc = val;
                    });
                  },
                ),
              ],
            ),
            verticalSpace(15.0),
            FieldAndLabel(
              controller: seatingCapacityController,
              labelValue: seating_capacity,
              hint: enter_seating_capacity,
              isRequire: true,
              inputType: TextInputType.number,
              validationMessage: errSeatingCapacity,
              onChanged: (value) {
                setState(() {
                  errSeatingCapacity = addressValidationMsg(value);
                });
              },
            ),
            verticalSpace(15.0),
            label(txt_petroleum),
            Row(
              children: [
                radioSelection(
                  value: petrol,
                  groupValue: petroleum,
                  onTap: (val) {
                    setState(() {
                      petroleum = val;
                    });
                  },
                ),
                horizontalSpace(10.0),
                radioSelection(
                  value: diesel,
                  groupValue: petroleum,
                  onTap: (val) {
                    setState(() {
                      petroleum = val;
                    });
                  },
                ),
                horizontalSpace(10.0),
                radioSelection(
                  value: gas,
                  groupValue: petroleum,
                  onTap: (val) {
                    setState(() {
                      petroleum = val;
                    });
                  },
                ),
              ],
            ),
            verticalSpace(15.0),
            submitButton(
              text: submit,
              bgColor: iconTextColor,
              textColor: white,
              margin: paddingSymmetric(horizontal: Screen.screenWidth * 0.2),
              onPressed: () {
                setState(() {
                  errDriverName =
                      driverNameValidationMsg(driverNameController.text);
                  errLicenceNumber =
                      licenceNumberValidationMsg(licenceNumberController.text);
                  errCarType = carTypeValidationMsg(carTypeController.text);
                  errCarBrand = carBrandValidationMsg(carBrandController.text);
                  errCar = carValidationMsg(carController.text);
                  errSeatingCapacity = seatingCapacityValidationMsg(
                      seatingCapacityController.text);
                });
                if (errDriverName == "" &&
                    errLicenceNumber == "" &&
                    errCarType == "" &&
                    errCarBrand == "" &&
                    errCar == "" &&
                    errSeatingCapacity == "" &&
                    driverNameController.text.isNotEmpty &&
                    licenceNumberController.text.isNotEmpty &&
                    carTypeController.text.isNotEmpty &&
                    carBrandController.text.isNotEmpty &&
                    carController.text.isNotEmpty &&
                    seatingCapacityController.text.isNotEmpty) {
                  String key =
                      FireBaseDatabaseInstance.vendorDatabase.push().key;
                  FireBaseDatabaseInstance.vendorDatabase
                      .child(widget.vendor.key)
                      .child(cars)
                      .child(key)
                      .set(
                        CarDataModel(
                          driverName: driverNameController.text,
                          licenceNumber: licenceNumberController.text,
                          carType: carTypeController.text,
                          carBrand: carBrandController.text,
                          car: carController.text,
                          seatingCapacity: seatingCapacityController.text,
                          acNonAc: acNonAc,
                          petroleum: petroleum,
                          key: key,
                          vendorKey: widget.vendor.key,
                        ).toMap(),
                      )
                      .then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: labels(
                          text: car_registered_successFully,
                          color: white,
                        ),
                      ),
                    );
                    Navigator.pop(context);
                  });
                }
              },
            ),
            verticalSpace(25.0),
          ],
        ),
      ),
    );
  }
}
