import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_flutter/model/weather/Weather.dart';
import 'package:mobx_flutter/service/weather_service.dart';

part 'weather_store.g.dart';

class WeatherStore = _WeatherStore with _$WeatherStore;

abstract class _WeatherStore with Store {
  @observable
  List<String> searchCity= ["New York", "London", "Paris","Tokyo","Sydney"];
  @observable
  List<Weather> weatherList = [
    Weather.fromJson({
      "request": {
        "type": "IATA",
        "query": "New, Lakefront Airport, United States of America",
        "language": "en",
        "unit": "m"
      },
      "location": {
        "name": "Lakefront Airport",
        "country": "United States of America",
        "region": "New Orleans",
        "lat": "30.036",
        "lon": "-90.026",
        "timezone_id": "America\/Chicago",
        "localtime": "2023-09-15 03:42",
        "localtime_epoch": 1694749320,
        "utc_offset": "-5.0"
      },
      "current": {
        "observation_time": "08:42 AM",
        "temperature": 28,
        "weather_code": 113,
        "weather_icons": [
          "https://cdn.worldweatheronline.com/images/wsymbols01_png_64/wsymbol_0008_clear_sky_night.png"
        ],
        "weather_descriptions": ["Clear"],
        "wind_speed": 19,
        "wind_degree": 30,
        "wind_dir": "NNE",
        "pressure": 1014,
        "precip": 0,
        "humidity": 77,
        "cloudcover": 0,
        "feelslike": 32,
        "uv_index": 1,
        "visibility": 16,
        "is_day": "no"
      }
    })
  ];
  @observable
  bool themedata = false;

  @computed
  bool get isThemeDark => themedata;

  @action
  Future<void> getWeather(String city) async {
    List<Weather>? weatherList = await WeatherService().getWeather(city);
    weatherList = weatherList ?? [];
  }

  @action
  Future<void> setTheme(bool isdark) async {
    themedata = await isdark;
  }

  _WeatherStore() {
    getWeather("New york");
  }
}
