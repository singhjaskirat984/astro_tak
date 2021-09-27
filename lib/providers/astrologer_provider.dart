import 'package:astro_tak/models/astrologer_data_model.dart';
import 'package:astro_tak/services/astrologer_data_service.dart';
import 'package:astro_tak/utilities/loading_enum.dart';
import 'package:flutter/material.dart';

class AstrologerDataProvider with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  AstrologerDataModel? astrologerDataModel;

  late AstrologerDataModel prevAstrologerDataModel;

  void fetchAstrologerData() async {
    this.loadingStatus = LoadingStatus.searching;
    try {
      astrologerDataModel =
      await AstrologerDataServices().fetchAstrologerDataService();
      this.loadingStatus = LoadingStatus.completed;
      print("questions length ${astrologerDataModel?.astrologerData!.length}");
    } catch (error) {
      this.loadingStatus = LoadingStatus.empty;
      print('error in fetchQuestionsData $error');
    }
    print("in fetchQuestionsData $loadingStatus");
    notifyListeners();
  }
  //someObjects.sort((a, b) => a.someProperty.compareTo(b.someProperty));
  void sortExperience(bool lowToHigh){
    if(lowToHigh){
      astrologerDataModel!.astrologerData.sort((a, b) => a.experience.compareTo(b.experience));
    }else{
      astrologerDataModel!.astrologerData.sort((a, b) => b.experience.compareTo(a.experience));
    }
   notifyListeners();
  }

  void sortPrice(bool lowToHigh){
    if(lowToHigh){
      astrologerDataModel!.astrologerData.sort((a, b) => a.minimumCallDurationCharges.compareTo(b.minimumCallDurationCharges));
    }else{
      astrologerDataModel!.astrologerData.sort((a, b) => b.minimumCallDurationCharges.compareTo(a.minimumCallDurationCharges));
    }
    notifyListeners();
  }

  void storeData(){
    prevAstrologerDataModel = astrologerDataModel!;
  }

  void revertData(){
    astrologerDataModel=prevAstrologerDataModel;
    notifyListeners();
  }

  void search(String val){
    print(val);
    if(val.isNotEmpty){
      List<AstrologerDatum> searchList =
      astrologerDataModel!.astrologerData.where((element){
        element.firstName.contains(val);
        throw(e){
          print(e);
        };
      }).toList();
      print("valldskfdsfksdf$val");
      print(searchList);
      astrologerDataModel!.astrologerData = searchList;
      notifyListeners();
    }else{
      astrologerDataModel = prevAstrologerDataModel;
      notifyListeners();
    }
  }
}
