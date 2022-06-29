import 'dart:async';



import '../../models/vendor_model.dart';

class VendorListBloc {
  StreamController<List<VendorDataModel>> vendorListController =
      StreamController<List<VendorDataModel>>();

  Stream<List<VendorDataModel>> get vendorListStream =>
      vendorListController.stream;

  Sink<List<VendorDataModel>> get vendorListSink => vendorListController.sink;

  setVendorData({required List<VendorDataModel> data}) {
    vendorListSink.add(data);
  }

  void dispose() {
    vendorListController.close();
  }
}
