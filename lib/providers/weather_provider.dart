import 'package:flutter/material.dart';
import 'package:weather_app/core/exception.dart';
import 'package:weather_app/core/failures.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_service.dart';


class WeatherProvider with ChangeNotifier {
  Weather? weather;
  bool isLoading = false;
  Failure? failure;

  final WeatherService weatherService = WeatherService();

  Future<void> fetchWeather(String city) async {
    isLoading = true;
    failure = null;
    weather=null;
         notifyListeners();


    try {
      weather = await weatherService.fetchWeather(city);
    } on AppException catch (e) {
      failure = mapExceptionToFailure(e);
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }

  String get errorMessage {
    return failure?.message ?? '';
  }
}

Failure mapExceptionToFailure(AppException exception) {
  if (exception is NoInternetException) {
    return const NetworkFailure();
  } else if (exception is CityNotFoundException) {
    return const NotFoundFailure();
  } else if (exception is ServerException) {
    return const ServerFailure();
  } else if (exception is UnexpectedException) {
    return UnexpectedFailure(exception.message);
  } else {
    return const UnexpectedFailure('Unknown error occurred');
  }
}
