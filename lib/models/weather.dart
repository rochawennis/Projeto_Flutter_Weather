import 'package:flutter/cupertino.dart';

class Weather with ChangeNotifier {
  var temp;
  var tempMax;
  var tempMin;
  var lat;
  var long;
  var feelsLike;
  var pressure;
  var description;
  var currently;
  var humidity;
  var windSpeed;
  var cityName;
  var icon;
  var country;
  var sunset;
  var sunrise;
  var date1;

  Weather({
    this.temp,
    this.tempMax,
    this.tempMin,
    this.lat,
    this.long,
    this.feelsLike,
    this.pressure,
    this.description,
    this.currently,
    this.humidity,
    this.windSpeed,
    this.cityName,
    this.icon,
    this.country,
    this.sunset,
    this.sunrise,
    this.date1,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['main']['temp'],
      tempMax: json['main']['temp_max'],
      tempMin: json['main']['temp_min'],
      lat: json['coord']['lat'],
      long: json['coord']['lon'],
      feelsLike: json['main']['feels_like'],
      pressure: json['main']['pressure'],
      description: json['weather'][0]['description'],
      currently: json['weather'][0]['main'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'],
      cityName: json['name'],
      icon: json['weather'][0]['icon'],
      country: json['sys']['country'],
      date1: DateTime.fromMillisecondsSinceEpoch(
        json['dt'] * 1000,
        isUtc: false,
      ),
      sunrise: DateTime.fromMillisecondsSinceEpoch(
        json['sys']['sunrise'] * 1000,
        isUtc: false,
      ),
      sunset: DateTime.fromMillisecondsSinceEpoch(
        json['sys']['sunset'] * 1000,
        isUtc: false,
      ),
    );
  }
}
