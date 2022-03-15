import 'package:flutter/material.dart';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';

class UvIndex {
  static String mapUviValueToString({var uvi}) {
    String uvIndex;
    if (uvi <= 2) {
      return uvIndex = 'Baixo';
    } else if (uvi <= 5) {
      return uvIndex = 'Médio';
    } else if (uvi <= 7) {
      return uvIndex = 'Alto';
    } else if (uvi <= 10) {
      return uvIndex = 'Elevado';
    } else if (uvi >= 11) {
      return uvIndex = 'Extremo';
    } else {
      uvIndex = 'Unknown';
    }
    return uvIndex;
  }
}

class CountryName {
  static String mapCountryNameToString({var country}) {
    String countryName;
    switch (country) {
      case 'US':
        countryName = 'EUA';
        break;
      case 'BR':
        countryName = 'Brasil';
        break;
      case 'IT':
        countryName = 'Itália';
        break;
      case 'UA':
        countryName = 'Ucrânia';
        break;
      case 'CN':
        countryName = 'China';
        break;
      case 'JP':
        countryName = 'Japão';
        break;
      case 'MX':
        countryName = 'México';
        break;
      default:
        countryName = '';
    }
    return countryName;
  }
}

class MapString {
  static Widget mapInputToWeather(String input, BuildContext context,
      {TextStyle style}) {
    String text2;
    switch (input) {
      case 'Tornado':
        text2 = 'Tornado';
        break;
      case 'Thunderstorm':
        text2 = 'Trovoada';
        break;
      case 'Drizzle':
        text2 = 'Garoa';
        break;
      case 'Rain':
        text2 = 'Chuva';
        break;
      case 'Snow':
        text2 = 'Neve';
        break;
      case 'Mist':
        text2 = 'Névoa';
        break;
      case 'fog':
        text2 = 'Névoa';
        break;
      case 'Smoke':
        text2 = 'Smoky';
        break;
      case 'Squall':
        text2 = 'Tempestaste';
        break;
      case 'Haze':
        text2 = 'Temp. de Areia';
        break;
      case 'Dust':
        text2 = 'Dusty';
        break;
      case 'Sand':
        text2 = 'Temp. de Areia';
        break;
      case 'Ash':
        text2 = 'Pred. Nublado';
        break;
      case 'Clear':
        text2 = "Limpo";
        break;
      case 'Clouds':
        text2 = "Nublado";
        break;
      default:
        text2 = "No Info";
    }
    return Text(
      text2,
      style: TextStyle(
        fontSize: 15,
      ),
    );
  }

  static Icon mapStringToIcon(
      String input, BuildContext context, double iconSize) {
    IconData myIcon;
    switch (input) {
      case 'Thunderstorm':
        myIcon = WeatherIcons.wiThunderstorm;
        break;
      case 'Drizzle':
        myIcon = WeatherIcons.wiSprinkle;
        break;
      case 'Rain':
        myIcon = WeatherIcons.wiRain;
        break;
      case 'Snow':
        myIcon = WeatherIcons.wiSnow;
        break;
      case 'Clear':
        myIcon = WeatherIcons.wiDaySunny;
        break;
      case 'Clouds':
        myIcon = WeatherIcons.wiCloudy;
        break;
      case 'Mist':
        myIcon = WeatherIcons.wiFog;
        break;
      case 'fog':
        myIcon = WeatherIcons.wiFog;
        break;
      case 'Smoke':
        myIcon = WeatherIcons.wiSmoke;
        break;
      case 'Haze':
      case 'Dust':
      case 'Sand':
        myIcon = WeatherIcons.wiSandstorm;
        break;
      case 'Ash':
        myIcon = WeatherIcons.wiVolcano;
        break;
      case 'Squall':
      case 'Tornado':
        myIcon = WeatherIcons.wiHurricaneWarning;
        break;
      case '01n':
        myIcon = WeatherIcons.wiNightClear;
        break;
      case '01d':
        myIcon = WeatherIcons.wiDaySunny;
        break;
      case '04n':
        myIcon = WeatherIcons.wiCloudy;
        break;
      case '10n':
        myIcon = WeatherIcons.wiRain;
        break;
      case '02n':
        myIcon = WeatherIcons.wiNightPartlyCloudy;
        break;
      case '03n':
        myIcon = WeatherIcons.wiCloud;
        break;
      case '04d':
        myIcon = WeatherIcons.wiCloudy;
        break;
      default:
        myIcon = WeatherIcons.wiNa;
    }
    return Icon(
      myIcon,
      size: iconSize,
      color: Theme.of(context).primaryColor,
    );
  }
}

// ignore: missing_return
String convertToDay(String day) {
  switch (day) {
    case 'Wed':
      return "Qua";

    case 'Thu':
      return "Qui";

    case 'Fri':
      return "Sex";

    case 'Sat':
      return "Sáb";

    case 'Sun':
      return "Dom";

    case 'Mon':
      return "Seg";

    case 'Tue':
      return "Ter";
  }
}

const List<Color> kDayTheme = [Color(0xFF1579EF), Color(0xFF78E9FB)];
const List<Color> kClouds = [ Colors.blueGrey, Colors.grey];
const List<Color> kRain = [ Colors.indigo,Colors.indigo ];
const List<Color> kRainNight = [ Colors.indigo,Color.fromARGB(255, 24, 39, 121)];
const List<Color> kThunderstorm = [ Colors.deepPurple, Colors.deepPurple];
const List<Color> kNightTheme = [Color(0xFF031B42), Color(0xFF415D8B)];
const List<Color> kSnow = [ Color.fromARGB(103, 255, 255, 255),Color.fromARGB(214, 255, 255, 255),Color.fromARGB(103, 255, 255, 255)];


const kNightThemeBar = Color(0xFF031B42);
const kDayThemeBar = Color(0xFF1579EF);
const kCloudsBar = Colors.blueGrey;
const kRainBar = Colors.indigo;
const kSnowBar = Color.fromARGB(214, 255, 255, 255);
const kThunderstormBar = Colors.deepPurple;
const kRainNightBar = Colors.indigo;







