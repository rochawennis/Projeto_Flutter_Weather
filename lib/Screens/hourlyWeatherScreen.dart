import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_weather/helper/utils.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../provider/weatherProvider.dart';

class HourlyScreen extends StatelessWidget {
  static const routeName = '/hourlyScreen';

  Widget dailyWidget(dynamic weather, BuildContext context) {
    final time = weather.date;
    final hours = DateFormat.Hm().format(time);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: weather.icon == '01n'
                ? kNightTheme
                : weather.icon == '01d'
                    ? kDayTheme
                    : weather.icon == '02n'
                        ? kNightTheme
                        : weather.icon == '02d'
                            ? kDayTheme
                            : weather.icon == '03d'
                                ? kClouds
                                : weather.icon == '03n'
                                    ? kClouds
                                    : weather.icon == '04d'
                                        ? kClouds
                                        : weather.icon == '04n'
                                            ? kClouds
                                            : weather.icon == '09d'
                                                ? kRain
                                                : weather.icon == '09n'
                                                    ? kRain
                                                    : weather.icon == '10d'
                                                        ? kRain
                                                        : weather.icon == '10n'
                                                            ? kRainNight
                                                            : weather.icon ==
                                                                    '11d'
                                                                ? kThunderstorm
                                                                : weather.icon ==
                                                                        '11n'
                                                                    ? kThunderstorm
                                                                    : weather.icon ==
                                                                            '13d'
                                                                        ? kSnow
                                                                        : weather.icon ==
                                                                                '13n'
                                                                            ? kSnow
                                                                            : weather.icon == '50n'
                                                                                ? kClouds
                                                                                : weather.icon == '50d'
                                                                                    ? kClouds
                                                                                    : weather.icon == 'null'
                                                                                        ? kDayTheme
                                                                                        : kDayTheme),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            hours ?? '',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          Spacer(),
          Text(
            '${weather.dailyTemp.toStringAsFixed(1)}°',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(),
              child: SvgPicture.asset("lib/assets/${weather.icon}.svg",
                  height: 50)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final weatherData = Provider.of<WeatherProvider>(context);
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: weatherData.weather.icon == '01n'
                  ? kNightThemeBar
                  : weatherData.weather.icon == '01d'
                      ? kDayThemeBar
                      : weatherData.weather.icon == '02n'
                          ? kNightThemeBar
                          : weatherData.weather.icon == '02d'
                              ? kDayThemeBar
                              : weatherData.weather.icon == '03d'
                                  ? kCloudsBar
                                  : weatherData.weather.icon == '03n'
                                      ? kCloudsBar
                                      : weatherData.weather.icon == '04d'
                                          ? kCloudsBar
                                          : weatherData.weather.icon == '04n'
                                              ? kCloudsBar
                                              : weatherData.weather.icon ==
                                                      '09d'
                                                  ? kRainBar
                                                  : weatherData.weather.icon ==
                                                          '09n'
                                                      ? kRainBar
                                                      : weatherData.weather
                                                                  .icon ==
                                                              '10d'
                                                          ? kRainBar
                                                          : weatherData.weather
                                                                      .icon ==
                                                                  '10n'
                                                              ? kRainBar
                                                              : weatherData
                                                                          .weather
                                                                          .icon ==
                                                                      '11d'
                                                                  ? kThunderstormBar
                                                                  : weatherData
                                                                              .weather
                                                                              .icon ==
                                                                          '11n'
                                                                      ? kThunderstormBar
                                                                      : weatherData.weather.icon ==
                                                                              '13d'
                                                                          ? kSnowBar
                                                                          : weatherData.weather.icon == '13n'
                                                                              ? kSnowBar
                                                                            : weatherData.weather.icon == '50n'
                                                                            ? kCloudsBar
                                                                              : weatherData.weather.icon == '50d'
                                                                            ? kCloudsBar
                                                                              : weatherData.weather.icon == 'null'
                                                                                  ? kDayThemeBar
                                                                                  : kNightThemeBar,
                                                                                  
        title: Text(
          'Próx. 24 hrs',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        height: mediaQuery.size.height,
        width: mediaQuery.size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: weatherData.weather.icon == '01n'
                  ? kNightTheme
                  : weatherData.weather.icon == '01d'
                      ? kDayTheme
                      : weatherData.weather.icon == '02n'
                          ? kNightTheme
                          : weatherData.weather.icon == '02d'
                              ? kDayTheme
                              : weatherData.weather.icon == '03d'
                                  ? kClouds
                                  : weatherData.weather.icon == '03n'
                                      ? kClouds
                                      : weatherData.weather.icon == '04d'
                                          ? kClouds
                                          : weatherData.weather.icon == '04n'
                                              ? kClouds
                                              : weatherData.weather.icon ==
                                                      '09d'
                                                  ? kRain
                                                  : weatherData.weather.icon ==
                                                          '09n'
                                                      ? kRain
                                                      : weatherData.weather
                                                                  .icon ==
                                                              '10d'
                                                          ? kRain
                                                          : weatherData.weather
                                                                      .icon ==
                                                                  '10n'
                                                              ? kRain
                                                              : weatherData
                                                                          .weather
                                                                          .icon ==
                                                                      '11d'
                                                                  ? kThunderstorm
                                                                  : weatherData
                                                                              .weather
                                                                              .icon ==
                                                                          '11n'
                                                                      ? kThunderstorm
                                                                      : weatherData.weather.icon ==
                                                                              '13d'
                                                                          ? kSnow
                                                                          : weatherData.weather.icon == '13n'
                                                                              ? kSnow
                                                                              : weatherData.weather.icon == '50n'
                                                                                  ? kClouds
                                                                                  : weatherData.weather.icon == '50d'
                                                                                      ? kClouds
                                                                                      : weatherData.weather.icon == 'null'
                                                                                          ? kDayTheme
                                                                                          : kNightTheme),
        ),
        child: ListView(
          children: weatherData.hourly24Weather
              .map((item) => dailyWidget(item, context))
              .toList(),
        ),
      ),
    );
  }
}
