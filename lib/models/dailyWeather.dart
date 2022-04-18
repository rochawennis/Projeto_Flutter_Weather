import 'package:flutter/cupertino.dart';

class DailyWeather with ChangeNotifier {
  var dailyTemp;
  var condition;
  var date;
  var precip;
  var uvi;
  var icon;
  var country;
  var city;
  var tempMaxD;
  var tempMinD;
  var dailyTemp1;
  var feelsLike;
  var windSpeed;
  var pressure1;
  var humidity1;
  var precipData1;

  DailyWeather({
    this.dailyTemp,
    this.condition,
    this.date,
    this.precip,
    this.uvi,
    this.icon,
    this.country,
    this.tempMaxD,
    this.tempMinD,
    this.city,
    this.dailyTemp1,
    this.feelsLike,
    this.windSpeed,
    this.pressure1,
    this.humidity1,
    this.precipData1,
  });

  factory DailyWeather.fromJson(Map<String, dynamic> json) {
    final precipData = json['daily'][0]['pop'];
    final calcPrecip = precipData * 100;
    final precipitation = calcPrecip.toStringAsFixed(0);

    return DailyWeather(
        precip: precipitation,
        uvi: json['daily'][0]['uvi'],
        tempMaxD: json['daily'][0]['temp']['max'],
        tempMinD: json['daily'][0]['temp']['min'],
        precipData1: json['daily'][0]['pop']);
  }

  static DailyWeather fromDailyJson(dynamic json) {
    return DailyWeather(
      dailyTemp: json['temp']['day'],
      dailyTemp1: json['temp']['min'],
      condition: json['weather'][0]['main'],
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000, isUtc: true),
      icon: json['weather'][0]['icon'],
    );
  }

  static DailyWeather fromHourlyJson(dynamic json) {
    final precipData1 = json['pop'];
    final calcPrecip1 = precipData1 * 100;
    final precipitation1 = calcPrecip1.toStringAsFixed(0);
    return DailyWeather(
        dailyTemp: json['temp'],
        condition: json['weather'][0]['main'],
        date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
        icon: json['weather'][0]['icon'],
        uvi: json['uvi'],
        feelsLike: json['feels_like'],
        windSpeed: json['wind_speed'],
        pressure1: json['pressure'],
        humidity1: json['humidity'],
        precipData1: precipitation1);
  }
}
