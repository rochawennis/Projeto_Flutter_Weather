import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_weather/widgets/settings_bloc.dart';
import 'package:flutter_weather/widgets/settings_state.dart';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../helper/utils.dart';
import '../models/dailyWeather.dart';
import '../provider/weatherProvider.dart';

class SevenDayForecast extends StatelessWidget {
  final wData;
  final List<DailyWeather> dWeather;
  SevenDayForecast({this.wData, this.dWeather});

  int _toFahrenheit(double celsius) => ((celsius * 9 / 5) + 32).round();

  String _formattedTemperature(double temp, TemperatureUnit temperatureUnit) =>
      temperatureUnit == TemperatureUnit.fahrenheit
          ? '${_toFahrenheit(temp)}°F'
          : '${temp.toDouble()}°';

  Widget dailyWidget(dynamic weather, BuildContext context) {
    final dayOfWeek = DateFormat("EEE").format(weather.date);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, settingsState) {
              var tempMax = double.parse(weather.dailyTemp.toStringAsFixed(1));
              var tempMin = double.parse(weather.dailyTemp1.toStringAsFixed(1));
              return Padding(
                padding: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      convertToDay(dayOfWeek) ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(),
                      child: SvgPicture.asset("lib/assets/${weather.icon}.svg",
                          height: 50),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            '${_formattedTemperature(tempMax, settingsState.temperatureUnit)}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          '| ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Center(
                          child: Text(
                            "${_formattedTemperature(tempMin, settingsState.temperatureUnit)}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _gridWeatherBuilder(String header, String body, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.blue,
                  size: 35,
                ),
                SizedBox(
                  width: 10,
                ),
                FittedBox(
                  child: Text(
                    body,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
              ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                child: Text(
                  header,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var tam = '${wData.weather.description}'.toString().length;
    final weatherData = Provider.of<WeatherProvider>(context);

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(0, 20, 0, 2),
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: WeatherUtils.getColor(weatherType: weatherData.weather.icon),
        ),
      ),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          SizedBox(height: MediaQuery.of(context).size.width / 15),
          Center(
            child: Text(
              'Informações Adicionais',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, settingsState) {
                var temp =
                    double.parse(wData.weather.feelsLike.toStringAsFixed(1));

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _gridWeatherBuilder('${wData.weather.humidity}%', 'Umidade',
                        WeatherIcons.wiHumidity),
                    _gridWeatherBuilder('${wData.weather.windSpeed} km/h',
                        'Vento', WeatherIcons.wiStrongWind),
                    _gridWeatherBuilder(
                        '${_formattedTemperature(temp, settingsState.temperatureUnit)}',
                        'Sens. Térmica',
                        WeatherIcons.wiThermometer),
                    _gridWeatherBuilder('${wData.weather.pressure} hPa',
                        'Pressão', WeatherIcons.wiBarometer),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width / 15),
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
              horizontal: 25,
            ),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromARGB(40, 0, 0, 0),
            ),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                Center(
                  child: Text(
                    'Próximos 7 Dias',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Hoje',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        BlocBuilder<SettingsBloc, SettingsState>(
                          builder: (context, settingsState) {
                            var temp = double.parse(
                                wData.weather.temp.toStringAsFixed(1));

                            return Text(
                              "${_formattedTemperature(temp, settingsState.temperatureUnit)}",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white),
                            );
                          },
                        ),
                        Text(
                          '${wData.weather.description.toString().toUpperCase()[0] + wData.weather.description.toString().substring(1, tam)}',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: SvgPicture.asset(
                        "lib/assets/${wData.weather.icon}.svg",
                        width: 70,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 50),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: dWeather
                        .map((item) => dailyWidget(item, context))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
