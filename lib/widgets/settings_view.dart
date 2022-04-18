import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';

import '../helper/utils.dart';
import '../provider/weatherProvider.dart';
import 'settings_bloc.dart';
import 'settings_event.dart';
import 'settings_state.dart';

/// 已宫格的形式展示多样的天气效果
/// 同时，支持切换列数

class SettingsWidget extends StatelessWidget {
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    final weatherData = Provider.of<WeatherProvider>(context);
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
          'Configurações',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, settingState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  child: Text(
                    "Unidade de Medida",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    color: Color.fromARGB(255, 233, 232, 232),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Fahrenheit",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Radio(
                        value: 'Fahrenheit',
                        groupValue: settingState.temperatureUnit ==
                                TemperatureUnit.celsius
                            ? 'Celsius'
                            : 'Fahrenheit',
                        onChanged: (value) =>
                            BlocProvider.of<SettingsBloc>(context).add(
                          SettingsEventToggleUnit(),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    color: Color.fromARGB(255, 233, 232, 232),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Celsius",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Radio(
                        value: 'Celsius',
                        groupValue: settingState.temperatureUnit ==
                                TemperatureUnit.celsius
                            ? 'Celsius'
                            : 'Fahrenheit',
                        onChanged: (value) =>
                            BlocProvider.of<SettingsBloc>(context).add(
                          SettingsEventToggleUnit(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
