import 'package:astro_tak/models/question_data_model.dart';
import 'package:astro_tak/services/question_data_service.dart';
import 'package:astro_tak/utilities/loading_enum.dart';
import 'package:flutter/material.dart';

class QuestionsDataProvider with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  QuestionsDataModel? questionsDataModel;

  void fetchQuestionsData() async {
    this.loadingStatus = LoadingStatus.searching;
    try {
      questionsDataModel =
          await QuestionDataServices().fetchQuestionsDataService();
      this.loadingStatus = LoadingStatus.completed;
      print("questions length ${questionsDataModel?.questionsData!.length}");
    } catch (error) {
      this.loadingStatus = LoadingStatus.empty;
      print('error in fetchQuestionsData $error');
    }
    print("in fetchQuestionsData $loadingStatus");
    notifyListeners();
  }
}
