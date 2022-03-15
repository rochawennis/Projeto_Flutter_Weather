import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './Screens/hourlyWeatherScreen.dart';
import './provider/weatherProvider.dart';
import './Screens/weeklyWeatherScreen.dart';
import './Screens/homeScreen.dart';

void main() {
  runApp(
    MyApp(),
  );
}



class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      child: ChangeNotifierProvider(
        create: (context) => WeatherProvider(),
        child: MaterialApp(
          title: 'Flutter Weather',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.transparent,
            primaryColor: Colors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
          ),
          home: HomeScreen(),
          routes: {
            WeeklyScreen.routeName: (myCtx) => WeeklyScreen(),
            HourlyScreen.routeName: (myCtx) => HourlyScreen(),
          },
        ),
      ),
    );
  }
}
