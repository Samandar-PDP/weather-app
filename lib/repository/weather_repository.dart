import 'package:flutter/cupertino.dart';
import 'package:weather_app/model/weahter.dart';
import 'package:weather_app/network/api_service.dart';
import 'package:weather_app/util/constants.dart';

class WeatherRepository {
  final _api = ApiService(buildDioClient(Constants.baseUrl));
  Future<WeatherResponse?> getCurrentWeather(String query) async {
    try {
       final response = await _api.getCurrentWeather(query);
       return response;
    } catch(e) {
      debugPrint(e.toString());
      return null;
    }
  }
}