// import 'package:astro_tak/services/horoscope_data_service.dart';
// import 'package:astro_tak/services/question_data_service.dart';
// import 'package:astro_tak/utilities/loading_enum.dart';
// import 'package:flutter/material.dart';
//
// class HomeDataProvider with ChangeNotifier {
//   LoadingStatus loadingStatus = LoadingStatus.searching;
//   HomeDataModel? homeDataModel;
//
//   void fetchQuestionsData() async {
//     this.loadingStatus = LoadingStatus.searching;
//     try {
//       homeDataModel =
//       await HomeDataServices().fetchHomeDataService();
//       this.loadingStatus = LoadingStatus.completed;
//       print("questions length ${homeDataModel?.questionsData!.length}");
//     } catch (error) {
//       this.loadingStatus = LoadingStatus.empty;
//       print('error in fetchQuestionsData $error');
//     }
//     print("in fetchQuestionsData $loadingStatus");
//     notifyListeners();
//   }
// }
