import 'package:astro_tak/models/question_data_model.dart';
import 'package:astro_tak/utilities/api_endpoints.dart';
import 'package:astro_tak/utilities/network_helper.dart';
import 'package:http/http.dart' as http;

class QuestionDataServices {
  NetworkHelper _networkHelper = NetworkHelper();

  Future<QuestionsDataModel> fetchQuestionsDataService() async {
    http.Response response = await _networkHelper
        .getData(ApiEndpoints.kApiBaseUrl + ApiEndpoints.questionDataApi);
    print("Response in QuestionDataServices is ${response.body}");
    return questionsDataModelFromJson(response.body);
  }
}
