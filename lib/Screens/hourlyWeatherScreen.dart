import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_weather/helper/utils.dart';
import 'package:flutter_weather/widgets/settings_state.dart';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../provider/weatherProvider.dart';
import '../widgets/settings_bloc.dart';

int _toFahrenheit(double celsius) => ((celsius * 9 / 5) + 32).round();

String _formattedTemperature(double temp, TemperatureUnit temperatureUnit) =>
    temperatureUnit == TemperatureUnit.fahrenheit
        ? '${_toFahrenheit(temp)}°F'
        : '${temp.toDouble()}°C';

class HourlyScreen extends StatelessWidget {
  static const routeName = '/hourlyScreen';

  Widget dailyWidget(dynamic weather, BuildContext context) {
    final time = weather.date;
    final hours = DateFormat.Hm().format(time);
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
      color: Colors.transparent,
      child: ExpansionTile(
        title: Text(
          hours ?? '',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
            height: MediaQuery.of(context).size.height / 3.8,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                //border: Border.all(color: Colors.white),
                //color: Colors.transparent,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Icon(
                                WeatherIcons.wiThermometer,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                            BlocBuilder<SettingsBloc, SettingsState>(
                              builder: (context, settingsState) {
                                var temp = double.parse(
                                    weather.dailyTemp.toStringAsFixed(1));

                                return Text(
                                  '${_formattedTemperature(temp, settingsState.temperatureUnit)}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Icon(
                                WeatherIcons.wiDaySunny,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              UvIndex.mapUviValueToString(uvi: weather.uvi),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                height: 1.5,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Icon(
                                WeatherIcons.wiHumidity,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${weather.humidity1}%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Icon(
                              WeatherIcons.wiStrongWind,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '${weather.windSpeed.toStringAsFixed(1)}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            width: 1,
                          ),
                          Text(
                            'km/h',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              height: 1.5,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Icon(
                              WeatherIcons.wiBarometer,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${weather.pressure1}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Icon(
                              WeatherIcons.wiUmbrella,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${weather.precipData1}%',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    child: SvgPicture.asset(
                      "lib/assets/${weather.icon}.svg",
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
        leading: IconButton(
          tooltip: 'Voltar',
          highlightColor: Colors.transparent,
          splashRadius: 27.5,
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor:
            WeatherUtils.getColorBar(weatherType: weatherData.weather.icon),
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
            colors:
                WeatherUtils.getColor(weatherType: weatherData.weather.icon),
          ),
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
