import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/widgets/settings_bloc.dart';
import 'package:flutter_weather/widgets/settings_state.dart';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../helper/utils.dart';
import '../provider/weatherProvider.dart';

class WeatherInfo extends StatelessWidget {
  final wData;
  WeatherInfo({this.wData});

  int _toFahrenheit(double celsius) => ((celsius * 9 / 5) + 32).round();

  String _formattedTemperature(double temp, TemperatureUnit temperatureUnit) =>
      temperatureUnit == TemperatureUnit.fahrenheit
          ? '${_toFahrenheit(temp)}°F'
          : '${temp.round()}°C';

  Widget _weatherInfoBuilder(String header, String body, IconData icon,
      double rightPad, double iconSize) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(20, 0, 0, 0),
      ),
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            icon,
            color: Colors.blue,
            size: 35,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(
                  header,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Color.fromARGB(200, 255, 255, 255),
                  ),
                ),
              ),
              FittedBox(
                child: Text(
                  body,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Colors.white,
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
    var weatherData = Provider.of<WeatherProvider>(context);
    var sunset =
        double.parse(DateFormat("HH").format(weatherData.weather.sunset));
    var sunrise =
        double.parse(DateFormat("HH").format(weatherData.weather.sunrise));
    var date = double.parse(DateFormat("HH").format(weatherData.weather.date1));

    print(DateFormat.Hm().format(weatherData.weather.sunrise));
    print(DateFormat.Hm().format(weatherData.weather.sunset));
    print(date);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(40, 0, 0, 0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LimitedBox(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    startAngle: 190,
                    endAngle: 350,
                    minimum: sunrise < sunset ? sunrise : sunset,
                    maximum: sunset > sunrise ? sunset : sunrise,
                    canScaleToFit: true,
                    showTicks: false,
                    showLabels: false,
                    pointers: <GaugePointer>[
                      RangePointer(
                          enableAnimation: true,
                          dashArray: [5, 5, 5],
                          cornerStyle: CornerStyle.startCurve,
                          value: date,
                          width: 2,
                          gradient: const SweepGradient(
                            colors: <Color>[
                              Color.fromARGB(255, 255, 255, 255),
                              Color.fromARGB(255, 255, 255, 255)
                            ],
                            stops: <double>[0.35, 0.75],
                          )),
                      MarkerPointer(
                          enableAnimation: true,
                          value: date,
                          markerWidth: 15,
                          markerHeight: 15,
                          markerType: MarkerType.circle,
                          color: Color.fromARGB(255, 246, 215, 114),
                          markerOffset: -1)
                    ],
                    axisLineStyle: AxisLineStyle(
                      dashArray: [5, 5, 5],
                      thickness: 0.01,
                      cornerStyle: CornerStyle.bothCurve,
                      color: Color.fromARGB(80, 255, 255, 255),
                      thicknessUnit: GaugeSizeUnit.factor,
                    ),
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        angle: 185,
                        positionFactor: 0.62,
                        widget: Text(
                          'Nascer do sol: ' +
                              '${DateFormat.Hm().format(weatherData.weather.sunrise)}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      GaugeAnnotation(
                        angle: 355,
                        positionFactor: 0.62,
                        widget: Text(
                          'Pôr do sol: ' +
                              '${DateFormat.Hm().format(weatherData.weather.sunset)}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LimitedBox(
                maxHeight: 100,
                maxWidth: 150,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: BlocBuilder<SettingsBloc, SettingsState>(
                    builder: (context, settingsState) {
                      return TweenAnimationBuilder<int>(
                        tween: IntTween(
                            begin: 0,
                            end: weatherData.currentWeather.tempMaxD.toInt()),
                        duration: const Duration(
                          milliseconds: 1030,
                        ),
                        builder: (context, value, child) {
                          return _weatherInfoBuilder(
                            'Máxima',
                            '${_formattedTemperature(value.toDouble(), settingsState.temperatureUnit)}',
                            WeatherIcons.wiThermometer,
                            5,
                            30,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              LimitedBox(
                maxHeight: 100,
                maxWidth: 150,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: BlocBuilder<SettingsBloc, SettingsState>(
                    builder: (context, settingsState) {
                      return TweenAnimationBuilder<int>(
                        tween: IntTween(
                            begin: 0,
                            end: weatherData.currentWeather.tempMinD.toInt()),
                        duration: const Duration(
                          milliseconds: 1030,
                        ),
                        builder: (context, value, child) {
                          return _weatherInfoBuilder(
                            'Mínima',
                            '${_formattedTemperature(value.toDouble(), settingsState.temperatureUnit)}',
                            WeatherIcons.wiThermometerExterior,
                            5,
                            30,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LimitedBox(
                maxHeight: 150,
                maxWidth: 150,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                            positionFactor: 0,
                            angle: 90,
                            widget: Text(
                              UvIndex.mapUviValueToString(uvi: wData.uvi),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          GaugeAnnotation(
                            positionFactor: 0.8,
                            angle: 90,
                            widget: Text(
                              'UV',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ],
                        showLabels: false,
                        showTicks: false,
                        minimum: 0,
                        maximum: 11,
                        pointers: <GaugePointer>[
                          RangePointer(
                            value: wData.uvi,
                            dashArray: <double>[5, 4],
                            gradient: const SweepGradient(
                              colors: <Color>[
                                Color.fromARGB(255, 255, 255, 255),
                                Color.fromARGB(255, 255, 255, 255)
                              ],
                              stops: <double>[0.35, 0.75],
                            ),
                          ),
                        ],
                        axisLineStyle: AxisLineStyle(
                          thickness: 0.13,
                          dashArray: <double>[5, 4],
                          cornerStyle: CornerStyle.bothCurve,
                          color: Color.fromARGB(80, 255, 255, 255),
                          thicknessUnit: GaugeSizeUnit.factor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              LimitedBox(
                maxHeight: 150,
                maxWidth: 150,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                              positionFactor: 0,
                              angle: 90,
                              widget: Text(
                                '${(wData.precipData1 * 100).toStringAsFixed(0)}%',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                          GaugeAnnotation(
                              positionFactor: 0.8,
                              angle: 90,
                              widget: Text(
                                'Chuva %',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ))
                        ],
                        minimum: 0,
                        maximum: 100,
                        showLabels: false,
                        showTicks: false,
                        pointers: <GaugePointer>[
                          RangePointer(
                              enableAnimation: true,
                              value: wData.precipData1 * 100.toDouble(),
                              width: 0.1,
                              sizeUnit: GaugeSizeUnit.factor,
                              cornerStyle: CornerStyle.startCurve,
                              gradient: const SweepGradient(colors: <Color>[
                                Color.fromARGB(255, 255, 255, 255),
                                Color.fromARGB(255, 255, 255, 255)
                              ], stops: <double>[
                                0.35,
                                0.75
                              ])),
                        ],
                        axisLineStyle: AxisLineStyle(
                          thickness: 0.1,
                          cornerStyle: CornerStyle.bothCurve,
                          color: Color.fromARGB(80, 255, 255, 255),
                          thicknessUnit: GaugeSizeUnit.factor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
