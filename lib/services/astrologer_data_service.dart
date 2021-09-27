import 'package:astro_tak/models/astrologer_data_model.dart';
import 'package:astro_tak/utilities/api_endpoints.dart';
import 'package:astro_tak/utilities/network_helper.dart';
import 'package:http/http.dart' as http;

class AstrologerDataServices {
  NetworkHelper _networkHelper = NetworkHelper();

  Future<AstrologerDataModel> fetchAstrologerDataService() async {
    http.Response response = await _networkHelper
        .getData(ApiEndpoints.kApiBaseUrl + ApiEndpoints.astrologerDataApi);
    print("Response in AstrologerDataServices is ${response.body}");
    return astrologerDataModelFromJson(response.body);
  }
}
