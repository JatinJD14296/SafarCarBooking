import 'dart:async';



import '../../models/car_model.dart';

class CarListBloc {
  StreamController<List<CarDataModel>> carListController =
      StreamController<List<CarDataModel>>();

  Stream<List<CarDataModel>> get carListStream =>
      carListController.stream;

  Sink<List<CarDataModel>> get carListSink => carListController.sink;

  setCarData({List<CarDataModel>? data}) {
    carListSink.add(data!);
  }

  void dispose() {
    carListController.close();
  }
}
