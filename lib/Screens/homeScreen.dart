import 'package:flutter/material.dart';
import 'package:flutter_weather/helper/utils.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../provider/weatherProvider.dart';
import '../widgets/WeatherInfo.dart';
import '../widgets/fadeIn.dart';
import '../widgets/hourlyForecast.dart';
import '../widgets/locationError.dart';
import '../widgets/mainWeather.dart';
import '../widgets/requestError.dart';
import '../widgets/weatherDetail.dart';
import '../widgets/sevenDayForecast.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/homeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  bool _isLoading;
  final _textController = TextEditingController();
  bool _validate = false;
  final fieldText = TextEditingController();


  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _textController.dispose();
  }

  Future<void> _getData() async {
    _isLoading = true;
    final weatherData = Provider.of<WeatherProvider>(context, listen: false);
    weatherData.getWeatherData();
    _isLoading = false;
  }

  Future<void> _refreshData(BuildContext context) async {
    await Provider.of<WeatherProvider>(context, listen: false).getWeatherData();
  }


bool isSearchEnabled = false;

void clearText() {
    _textController.clear();    
  }

  _switchSearchBarState() {
    setState(() {
      isSearchEnabled = !isSearchEnabled;
      clearText();
    }, 
    );
  }

  @override
  Widget build(BuildContext context) {
    final weatherData = Provider.of<WeatherProvider>(context);
    final myContext = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
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
            title: !isSearchEnabled ? 
            IconButton(icon: Icon(Icons.search_rounded), alignment:Alignment.centerLeft,
             onPressed: () {
             _switchSearchBarState();
             },) 
             : TextField(
              style: new TextStyle(
                color: Colors.white,
              ),
              autofocus: true,
              controller: _textController,
              decoration: new InputDecoration(
                isCollapsed: true,
                prefixIcon: new Icon(Icons.location_on_outlined, color: Colors.white),
                prefixIconConstraints: BoxConstraints(
                minHeight: 32,
                minWidth: 32,
              ),
              suffixIcon: new IconButton(
              icon: Icon(isSearchEnabled ? Icons.close : Icons.search),
              onPressed: () => {
                      _switchSearchBarState()
                     },
              color: Colors.white,
              ),
                hintMaxLines: 1,
                hintText: "Pesquise uma cidade",
                hintStyle: new TextStyle(color: Colors.white.withOpacity(0.5)),
                contentPadding: EdgeInsets.fromLTRB(1,15,1,1),
                errorText: _validate ? null : null,
                ),
                onSubmitted: (value) {
              setState(
                () {
                _textController.text.isEmpty
                      ? _validate = true
                      : Provider.of<WeatherProvider>(context, listen: false)
                          .searchWeatherData(location: value);    
                },
              );
              _switchSearchBarState();
            },
          ),actions: <Widget>[
              IconButton(
                onPressed:  () => _refreshData(context),
                icon: Icon(Icons.refresh),alignment:Alignment.centerLeft,                
              ),
            ],
          ),
      body: Container(
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
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: _isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: myContext.primaryColor,
                  ),
                )
              : weatherData.loading
                  ? Center(
                      child: CircularProgressIndicator(
                        backgroundColor: myContext.backgroundColor,
                      ),
                    )
                  : weatherData.isLocationError
                      ? LocationError()
                      : Column(
                          children: [
                            SizedBox(height: 10,),
                            SmoothPageIndicator(
                              controller: _pageController,
                              count: 2,
                              effect: ExpandingDotsEffect(
                                activeDotColor: myContext.primaryColor,
                                strokeWidth: 5,
                                spacing: 5,
                                dotHeight: 6,
                                dotWidth: 2,
                              ),
                            ),
                            weatherData.isRequestError
                                ? RequestError()
                                : Expanded(
                                    child: PageView(
                                      controller: _pageController,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          width: mediaQuery.size.width,
                                          child: RefreshIndicator(
                                            onRefresh: () =>
                                                _refreshData(context),
                                            backgroundColor: Colors.white,
                                            child: ListView(
                                              children: [
                                                FadeIn(
                                                    delay: 0,
                                                    child: MainWeather(
                                                        wData: weatherData),),
                                                FadeIn(
                                                  delay: 0.33,
                                                  child: WeatherInfo(
                                                      wData: weatherData
                                                          .currentWeather),
                                                ),
                                                FadeIn(
                                                  delay: 0.66,
                                                  child: HourlyForecast(
                                                      weatherData
                                                          .hourlyWeather),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: mediaQuery.size.height,
                                          width: mediaQuery.size.width,
                                          child: ListView(
                                            children: [
                                              FadeIn(
                                                delay: 0.33,
                                                child: SevenDayForecast(
                                                  wData: weatherData,
                                                  dWeather: weatherData
                                                      .sevenDayWeather,
                                                ),
                                              ),
                                              FadeIn(
                                                  delay: 0.66,
                                                  child: WeatherDetail(
                                                      wData: weatherData),),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
        ),
      ),
    );
  }
}
