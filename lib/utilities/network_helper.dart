import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  Future? getData(String url) async {
    try {
      http.Response response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 30));
      return response;
    } on TimeoutException catch (e) {
      print('TimeOut exception: $e');
      return null;
    } on SocketException catch (e) {
      print('Socket Error: $e');
      return null;
    } on Error catch (e) {
      print('General Error: $e');
      return null;
    }
  }

  Future postData({required String url, required Map postBody}) async {
    try {
      http.Response response = await http
          .post(Uri.parse(url), body: jsonEncode(postBody))
          .timeout(Duration(seconds: 30));
      return response;
    } on TimeoutException catch (e) {
      print('TimeOut exception: $e');
      return null;
    } on SocketException catch (e) {
      print('Socket Error: $e');
      return null;
    } on Error catch (e) {
      print('General Error: $e');
      return null;
    }
  }

  Future putData({required String url, required Map putBody}) async {
    try {
      http.Response response = await http
          .put(Uri.parse(url), body: jsonEncode(putBody))
          .timeout(Duration(seconds: 30));
      return response;
    } on TimeoutException catch (e) {
      print('TimeOut exception: $e');
      return null;
    } on SocketException catch (e) {
      print('Socket Error: $e');
      return null;
    } on Error catch (e) {
      print('General Error: $e');
      return null;
    }
  }
}
