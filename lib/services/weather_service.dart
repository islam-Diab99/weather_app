import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/core/exception.dart';
import 'package:weather_app/models/weather.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class WeatherService {
  static const String _apiKey = '874052e84d347c113b195247ec5518fa';
  static const String _baseUrl =
      'https://api.openweathermap.org/data/2.5/weather';

  Future<Weather?> fetchWeather(String city) async {
    final url = Uri.parse('$_baseUrl?q=$city&appid=$_apiKey&units=metric');

    bool hasInternet = await InternetConnection().hasInternetAccess;
    if (!hasInternet) {
      throw const NoInternetException();
    } else {
      try {
        final response = await http.get(url);

        if (response.statusCode == 200) {
          final Map<String, dynamic> data = jsonDecode(response.body);
          return Weather.fromJson(data);
        } else if (response.statusCode == 404) {
          throw const CityNotFoundException();
        } else {
          throw const ServerException();
        }
      } catch (e) {
        throw UnexpectedException(e.toString());
      }
    }
  }
}
