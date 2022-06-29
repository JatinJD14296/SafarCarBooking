class CarDataModel {
  final String driverName;
  final String licenceNumber;
  final String carType;
  final String carBrand;
  final String car;
  final String seatingCapacity;
  final String acNonAc;
  final String petroleum;
  final String key;
  final String vendorKey;

  CarDataModel({
    this.driverName = "",
    this.licenceNumber = "",
    this.carType = "",
    this.carBrand = "",
    this.car = "",
    this.seatingCapacity = "",
    this.acNonAc = "",
    this.petroleum = "",
    this.key = "",
    this.vendorKey = "",
  });

  @override
  toMap() => {
        "Driver Name": driverName,
        "Licence Number": licenceNumber,
        "Car Type": carType,
        "Car Brand": carBrand,
        "Car": car,
        "Seating Capacity": seatingCapacity,
        "Ac NonAc": acNonAc,
        "Petroleum": petroleum,
        "Vendor Key": vendorKey,
        "Key": key,
      };
}
