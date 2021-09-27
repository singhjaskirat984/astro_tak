import 'package:astro_tak/models/hororscope_data_model.dart';
import 'package:astro_tak/utilities/api_endpoints.dart';
import 'package:astro_tak/utilities/network_helper.dart';
import 'package:http/http.dart' as http;

class HororscopeDataServices {
  NetworkHelper _networkHelper = NetworkHelper();

  Future<HororscopeDataModel> fetchHororscopeDataService() async {
    http.Response response = await _networkHelper
        .getData(ApiEndpoints.kApiBaseUrl + ApiEndpoints.hororscopeDataApi);
    print("Response in HororScopeDataServices is ${response.body}");
    return hororscopeDataModelFromJson(response.body);
  }
}
