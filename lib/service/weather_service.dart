import 'dart:convert';

import 'package:mobx_flutter/model/weather/Weather.dart';
import 'package:mobx_flutter/service/api_service.dart';

import '../model/user/user.dart';

class WeatherService extends APIService {
  WeatherService();

  factory WeatherService.getInstance() => _instance;
  static final WeatherService _instance = WeatherService();

  Future<List<Weather>?> getWeather(String? city) async {
    final response = await (get("current", params: {
      "access_key": "e5e9ed5a38a1bb9a0cfcbfafa2a1d996",
      "query": city ?? "New york"
    }));

    if (response == null) {
      return null;
    }
    return List<Weather>.from(
        response['data'].map((model) => Weather.fromJson(model)));
  }
}
