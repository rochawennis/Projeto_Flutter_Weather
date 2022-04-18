import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/widgets/settings_state.dart';
import 'package:provider/provider.dart';
import '../provider/weatherProvider.dart';
import 'settings_bloc.dart';

class MainWeather extends StatelessWidget {
  final wData;

  MainWeather({this.wData});

  final TextStyle _style1 =
      TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: Colors.white);

  int _toFahrenheit(double celsius) => ((celsius * 9 / 5) + 32).round();

  String _formattedTemperature(double temp, TemperatureUnit temperatureUnit) =>
      temperatureUnit == TemperatureUnit.fahrenheit
          ? '${_toFahrenheit(temp)}'
          : '${temp.round()}';

  String _formattedTemperatureUnit(
          double temp, TemperatureUnit temperatureUnit) =>
      temperatureUnit == TemperatureUnit.fahrenheit ? 'F' : 'C';

  @override
  Widget build(BuildContext context) {
    final weatherData = Provider.of<WeatherProvider>(context);
    var cidade = weatherData.weather.cityName;
    print(cidade);
    var tam = '${wData.weather.description}'.toString().length;
    return Container(
      padding: EdgeInsets.all(2),
      height: MediaQuery.of(context).size.height / 1.2,
      width: MediaQuery.of(context).size.width,
      child: Flex(
        direction: Axis.vertical,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              Icon(Icons.location_on_outlined, color: Colors.white),
              Text(
                  '${wData.weather.cityName}' +
                      ', ' +
                      '${wData.weather.country}',
                  style: _style1),
            ],
          ),
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<SettingsBloc, SettingsState>(
                builder: (context, settingsState) {
                  return TweenAnimationBuilder<int>(
                    tween: IntTween(begin: 0, end: wData.weather.temp.toInt()),
                    duration: const Duration(
                      milliseconds: 1030,
                    ),
                    builder: (context, value, child) {
                      return Text(
                        '${_formattedTemperature(value.toDouble(), settingsState.temperatureUnit)}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 205,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(200, 255, 255, 255),
                        ),
                      );
                    },
                  );
                },
              ),
              Text(
                '°',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(200, 255, 255, 255),
                ),
              ),
              BlocBuilder<SettingsBloc, SettingsState>(
                builder: (context, settingsState) {
                  return SizedBox(
                    child: Text(
                      '${_formattedTemperatureUnit(wData.weather.temp.toDouble(), settingsState.temperatureUnit)}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(200, 255, 255, 255),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${wData.weather.description.toString().toUpperCase()[0] + wData.weather.description.toString().substring(1, tam)}',
                style: _style1.copyWith(fontSize: 19),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
