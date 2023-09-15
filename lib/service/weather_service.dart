
import 'package:mobx_flutter/model/weather/Weather.dart';
import 'package:mobx_flutter/service/api_service.dart';


class WeatherService extends APIService {
  WeatherService();

  factory WeatherService.getInstance() => _instance;
  static final WeatherService _instance = WeatherService();

  Future<Weather?> getWeather(String? city) async {
    final response = await (get("current", params: {
      "access_key": "e5e9ed5a38a1bb9a0cfcbfafa2a1d996",
      "query": city ?? "New york"
    }));

    if (response == null) {
      return null;
    }
    // List<Weather> list = [];
    // response.forEach((element) {
    //   list.add(Weather.fromJson(element));
    // });
    return Weather.fromJson(response);
    // return List<Weather>.from(response['data'].map((model) => Weather.fromJson(model)));
  }
}
