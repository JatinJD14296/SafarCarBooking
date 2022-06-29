// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:safarcarbooking/common/widgets/buttons.dart';
// import 'package:safarcarbooking/models/car_model.dart';
// import 'package:safarcarbooking/models/vendor_model.dart';
// import 'package:safarcarbooking/network/firestore_instance.dart';
// import 'package:safarcarbooking/screens/car_registration/car_registration_screen.dart';
// import 'package:safarcarbooking/utils/screen_utils.dart';
// import 'package:safarcarbooking/utils/strings.dart';
import 'dart:html';

import '../../common/widgets/buttons.dart';
import '../../common/widgets/padding_margin.dart';
import '../../common/widgets/space_and_dividers.dart';
import '../../common/widgets/text_and_styles.dart';
import '../../models/car_model.dart';
import '../../models/vendor_model.dart';
import '../../network/firestore_instance.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../car_registration/car_registration_screen.dart';
import 'car_list_bloc.dart';
import 'car_list_widget.dart';

class CarListScreen extends StatefulWidget {
  final VendorDataModel vendor;

  CarListScreen(this.vendor);

  @override
  _CarListScreenState createState() => _CarListScreenState();
}

class _CarListScreenState extends State<CarListScreen> {
  List<CarDataModel> carList = [];

  CarListBloc bloc = CarListBloc();

  @override
  void initState() {
    FireBaseDatabaseInstance.vendorDatabase
        .child(widget.vendor.key)
        .child(cars)
        .once()
        .then((value) {
      carList.clear();

      value.value.forEach((k, v) {
      print(v);
        carList.add(
          CarDataModel(
            driverName: v['Driver Name'],
            licenceNumber: v['Licence Number'],
            carType: v['Car Type'],
            carBrand: v['Car Brand'],
            car: v['Car'],
            seatingCapacity: v['Seating Capacity'],
            acNonAc: v['Ac NonAc'],
            petroleum: v['Petroleum'],
            vendorKey: v['Vendor Key'],
            key: v['Key'],
          ),
        );
      });
      bloc.setCarData(data: carList);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: paddingAll(10.0),
          child: Column(
            children: [
              carListAppBar(context),
              Expanded(
                child: StreamBuilder(
                  stream: bloc.carListStream,
                  builder: (context, snapshot) {
                    return (snapshot.hasData)
                        ? ListView.builder(
                            itemCount: carList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: paddingAll(8.0),
                                child: Card(
                                  elevation: 20.0,
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    title: labels(
                                      text: "Car : " + carList[index].car,
                                      textAlign: TextAlign.start,
                                      size: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    subtitle: labels(
                                      text: "Driver Name : " +
                                          carList[index].driverName,
                                      textAlign: TextAlign.start,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                        : Center(child: labels(text: "Data Not Found"));
                  },
                ),
              ),
              verticalSpace(10.0),
              submitButton(
                bgColor: primaryYellow,
                text: add_car,
                margin: paddingSymmetric(horizontal: Screen.screenWidth * 0.2),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CarRegistration(vendor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
