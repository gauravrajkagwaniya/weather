// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WeatherStore on _WeatherStore, Store {
  Computed<Weather>? _$weatherListComputed;

  @override
  Weather get weatherList =>
      (_$weatherListComputed ??= Computed<Weather>(() => super.weatherList,
              name: '_WeatherStore.weatherList'))
          .value;
  Computed<bool>? _$isThemeDarkComputed;

  @override
  bool get isThemeDark =>
      (_$isThemeDarkComputed ??= Computed<bool>(() => super.isThemeDark,
              name: '_WeatherStore.isThemeDark'))
          .value;

  late final _$searchCityAtom =
      Atom(name: '_WeatherStore.searchCity', context: context);

  @override
  List<String> get searchCity {
    _$searchCityAtom.reportRead();
    return super.searchCity;
  }

  @override
  set searchCity(List<String> value) {
    _$searchCityAtom.reportWrite(value, super.searchCity, () {
      super.searchCity = value;
    });
  }

  late final _$weatherdataAtom =
      Atom(name: '_WeatherStore.weatherdata', context: context);

  @override
  Weather get weatherdata {
    _$weatherdataAtom.reportRead();
    return super.weatherdata;
  }

  @override
  set weatherdata(Weather value) {
    _$weatherdataAtom.reportWrite(value, super.weatherdata, () {
      super.weatherdata = value;
    });
  }

  late final _$themedataAtom =
      Atom(name: '_WeatherStore.themedata', context: context);

  @override
  bool get themedata {
    _$themedataAtom.reportRead();
    return super.themedata;
  }

  @override
  set themedata(bool value) {
    _$themedataAtom.reportWrite(value, super.themedata, () {
      super.themedata = value;
    });
  }

  late final _$getWeatherAsyncAction =
      AsyncAction('_WeatherStore.getWeather', context: context);

  @override
  Future<void> getWeather(String city) {
    return _$getWeatherAsyncAction.run(() => super.getWeather(city));
  }

  late final _$setThemeAsyncAction =
      AsyncAction('_WeatherStore.setTheme', context: context);

  @override
  Future<void> setTheme(bool isdark) {
    return _$setThemeAsyncAction.run(() => super.setTheme(isdark));
  }

  @override
  String toString() {
    return '''
searchCity: ${searchCity},
weatherdata: ${weatherdata},
themedata: ${themedata},
weatherList: ${weatherList},
isThemeDark: ${isThemeDark}
    ''';
  }
}
