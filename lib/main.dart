import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/widgets/settings_view.dart';
import 'package:provider/provider.dart';

import './Screens/hourlyWeatherScreen.dart';
import './provider/weatherProvider.dart';
import './Screens/weeklyWeatherScreen.dart';
import './Screens/homeScreen.dart';
import 'widgets/settings_bloc.dart';

void main() {
  runApp(
    BlocProvider<SettingsBloc>(
      create: (context) => SettingsBloc(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider(
        create: (context) => WeatherProvider(),
        child: MaterialApp(
          title: 'UniWeather',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.transparent,
            primaryColor: Colors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomeScreen(),
          routes: {
            WeeklyScreen.routeName: (myCtx) => WeeklyScreen(),
            HourlyScreen.routeName: (myCtx) => HourlyScreen(),
            SettingsWidget.routeName: (myCtx) => SettingsWidget(),
          },
        ),
      ),
    );
  }
}
