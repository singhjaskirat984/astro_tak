import 'package:astro_tak/models/hororscope_data_model.dart';
import 'package:astro_tak/services/horoscope_data_service.dart';
import 'package:astro_tak/utilities/loading_enum.dart';
import 'package:flutter/material.dart';

class HororscopeDataProvider with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  HororscopeDataModel? hororscopeDataModel;

  void fetchHororscopeData() async {
    this.loadingStatus = LoadingStatus.searching;
    // try {
      hororscopeDataModel =
      await HororscopeDataServices().fetchHororscopeDataService();
      this.loadingStatus = LoadingStatus.completed;
      print("horoscope length ${hororscopeDataModel?.hororscopeData.length}");
    // } catch (error) {
    //   this.loadingStatus = LoadingStatus.empty;
    //   print('error in fetchhoroscopeData $error');
    // }
    print("in fetchhoroscopeData $loadingStatus");
    notifyListeners();
  }
}
