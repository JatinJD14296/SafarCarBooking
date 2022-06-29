class VendorDataModel {
  final String firmName;
  final String vendorName;
  final String mobileNumber;
  final String email;
  final String gst;
  final String address;
  final String password;
  final String key;

      VendorDataModel({
     this.firmName,
    this.vendorName,
    this.mobileNumber,
    this.email,
    this.gst,
    this.address,
    this.password,
    this.key,
  });

  @override
  toMap() => {
        "Firm Name": firmName,
        "VendorName": vendorName,
        "MobileNumber": mobileNumber,
        "Email": email,
        "GST": gst,
        "Address": address,
        "Password": password,
        "Key": key,
      };
}
