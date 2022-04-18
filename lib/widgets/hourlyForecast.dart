import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather/widgets/settings_bloc.dart';
import 'package:flutter_weather/widgets/settings_state.dart';
import 'package:intl/intl.dart';
import '../Screens/hourlyWeatherScreen.dart';
import '../models/dailyWeather.dart';

class HourlyForecast extends StatelessWidget {
  final List<DailyWeather> hourlyForecast;

  HourlyForecast(this.hourlyForecast);

  int _toFahrenheit(double celsius) => ((celsius * 9 / 5) + 32).round();

  String _formattedTemperature(double temp, TemperatureUnit temperatureUnit) =>
      temperatureUnit == TemperatureUnit.fahrenheit
          ? '${_toFahrenheit(temp)}°F'
          : '${temp.toDouble()}°C';

  Widget hourlyWidget(dynamic weather, BuildContext context) {
    final currentTime = weather.date;
    final hours = DateFormat.Hm().format(currentTime);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.transparent,
      ),
      height: 150,
      child: Row(
        children: [
          BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, settingsState) {
            var temp = double.parse(weather.dailyTemp.toStringAsFixed(1));
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    hours,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: SvgPicture.asset("lib/assets/${weather.icon}.svg",
                        height: 70),
                  ),
                  Container(
                    child: Text(
                      '${_formattedTemperature(temp, settingsState.temperatureUnit)}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 1, top: 20, bottom: 1),
                child: Text(
                  'Próximas 3 horas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: hourlyForecast
                .map((item) => hourlyWidget(item, context))
                .toList(),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Colors.blue.withOpacity(0.4),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: FloatingActionButton.extended(
                        tooltip: 'Detalhes',
                        label: Text(
                          'Próximas 24hrs',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(HourlyScreen.routeName);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
