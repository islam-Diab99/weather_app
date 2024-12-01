class Weather {
  final String name;
  final String description;
  final String icon;
  final double temp;
  final int humidity;
  final double windSpeed;
  final double tempMin;
  final double tempMax;
  final int sunrise;
  final int sunset;
  final int dt;

  Weather({
    required this.name,
    required this.description,
    required this.icon,
    required this.temp,
    required this.humidity,
    required this.windSpeed,
    required this.tempMin,
    required this.tempMax,
    required this.sunrise,
    required this.sunset,
    required this.dt,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      name: json['name'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      temp: json['main']['temp'].toDouble(),
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'].toDouble(),
      tempMin: json['main']['temp_min'].toDouble(),
      tempMax: json['main']['temp_max'].toDouble(),
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
      dt: json['dt'],
    );
  }
}
