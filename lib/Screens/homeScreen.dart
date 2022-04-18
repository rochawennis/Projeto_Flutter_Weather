import 'package:flutter/material.dart';
import 'package:flutter_weather/helper/utils.dart';
import 'package:flutter_weather/widgets/searchBar.dart';
import 'package:flutter_weather_bg/bg/weather_bg.dart';
import 'package:flutter_weather_bg/utils/weather_type.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather_icons/weather_icons.dart';
import '../provider/weatherProvider.dart';
import '../widgets/WeatherInfo.dart';
import '../widgets/fadeIn.dart';
import '../widgets/hourlyForecast.dart';
import '../widgets/locationError.dart';
import '../widgets/mainWeather.dart';
import '../widgets/requestError.dart';
import '../widgets/sevenDayForecast.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/homeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum OptionsMenu { settings, about }

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  bool _isLoading;
  final _textController = TextEditingController();
  final fieldText = TextEditingController();
  int index;

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

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                WeatherIcons.day_sunny,
                size: 45,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('UniWeather',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  Text(
                    '1.0.0',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '\n©2022 Company',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
              SizedBox(),
            ],
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text(
                  '\nAplicativo desenvolvido no 1º semestre de 2022 na Universidade Nove de Julho (Uninove)'),
              Text(
                  '\nDisciplina: Computação Móvel e Desenvolvimento de Aplicativos Móveis'),
              Text('\nProfessor: Edson Melo de Souza'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Desenvolvedores',
              style: TextStyle(fontSize: 18),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: const <Widget>[
                          Text('\nWennis Rocha de Andrade'),
                          Text('\nLeonardo Henrique Santos de Jesus'),
                          Text('\nRafael Duarte Morales'),
                          Text('\nHenrique de Oliveira Carlos'),
                          Text('\nGustavo Metzner'),
                          Text('\nVinícius Souza de Carvalho'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text(
                          'OK',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ]),
              );
            },
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text(
              'OK',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  _onOptionMenuItemSelected(OptionsMenu item) {
    switch (item) {
      case OptionsMenu.settings:
        Navigator.of(context).pushNamed('/settings');
        break;
      case OptionsMenu.about:
        _showDialog();
        break;
    }
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: SearchBar(),
      actions: <Widget>[
        IconButton(
          onPressed: () => _refreshData(context),
          icon: Icon(
            Icons.my_location,
          ),
          tooltip: 'Localização',
          alignment: Alignment.centerLeft,
        ),
        PopupMenuButton<OptionsMenu>(
          child: Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 30,
          ),
          onSelected: this._onOptionMenuItemSelected,
          itemBuilder: (context) => <PopupMenuEntry<OptionsMenu>>[
            PopupMenuItem<OptionsMenu>(
              value: OptionsMenu.settings,
              child: Text("Configurações"),
            ),
            PopupMenuItem<OptionsMenu>(
              value: OptionsMenu.about,
              child: Text("Sobre"),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final weatherData = Provider.of<WeatherProvider>(context);
    final myContext = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    print(weatherData.weather.icon);
    if (weatherData.weather.icon == '01d') {
      index = 7;
    } else if (weatherData.weather.icon == '01n') {
      index = 6;
    } else if (weatherData.weather.icon == '04n') {
      index = 9;
    } else if (weatherData.weather.icon == '03n') {
      index = 9;
    } else if (weatherData.weather.icon == '03d') {
      index = 8;
    } else if (weatherData.weather.icon == '04d') {
      index = 12;
    } else if (weatherData.weather.icon == '10n') {
      index = 0;
    } else if (weatherData.weather.icon == '10d') {
      index = 0;
    } else if (weatherData.weather.icon == '02n') {
      index = 11;
    } else if (weatherData.weather.icon == '02d') {
      index = 11;
    } else if (weatherData.weather.icon == '09n') {
      index = 4;
    } else if (weatherData.weather.icon == '09d') {
      index = 4;
    } else if (weatherData.weather.icon == '50d') {
      index = 13;
    } else if (weatherData.weather.icon == '50n') {
      index = 13;
    } else {
      index = 0;
    }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors:
                WeatherUtils.getColor(weatherType: weatherData.weather.icon),
          ),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Colors.white)),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Aguarde...',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    )
                  : weatherData.isLocationError
                      ? LocationError()
                      : Material(
                          child: ClipRRect(
                            borderRadius: BorderRadius.zero,
                            child: Container(
                              child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  WeatherBg(
                                    weatherType: WeatherType.values[index],
                                    width:
                                        MediaQuery.of(context).size.width * 1.2,
                                    height: MediaQuery.of(context).size.height,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        heightFactor: 30,
                                        child: SmoothPageIndicator(
                                          controller: _pageController,
                                          count: 2,
                                          effect: ExpandingDotsEffect(
                                            activeDotColor:
                                                myContext.primaryColor,
                                            dotHeight: 6,
                                            dotWidth: 6,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  weatherData.isRequestError
                                      ? RequestError()
                                      : ClipRect(
                                          child: PageView(
                                            controller: _pageController,
                                            children: [
                                              RefreshIndicator(
                                                edgeOffset: 70,
                                                onRefresh: () =>
                                                    _refreshData(context),
                                                backgroundColor: Colors.white,
                                                child: ListView(
                                                  children: <Widget>[
                                                    buildAppBar(),
                                                    FadeIn(
                                                      delay: 0,
                                                      child: MainWeather(
                                                          wData: weatherData),
                                                    ),
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
                                              Container(
                                                height: mediaQuery.size.height,
                                                width: mediaQuery.size.width,
                                                child: ListView(
                                                  children: [
                                                    buildAppBar(),
                                                    SizedBox(
                                                      height: 50,
                                                    ),
                                                    FadeIn(
                                                      delay: 0.33,
                                                      child: SevenDayForecast(
                                                        wData: weatherData,
                                                        dWeather: weatherData
                                                            .sevenDayWeather,
                                                      ),
                                                    ),
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
                        ),
        ),
      ),
    );
  }
}
