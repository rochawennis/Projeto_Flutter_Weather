import 'package:flutter/material.dart';

class UvIndex {
  static String mapUviValueToString({var uvi}) {
    String uvIndex;
    if (uvi <= 2) {
      return uvIndex = 'Baixo';
    } else if (uvi <= 5) {
      return uvIndex = 'Médio';
    } else if (uvi <= 7) {
      return uvIndex = 'Alto';
    } else if (uvi < 11) {
      return uvIndex = 'Elevado';
    } else if (uvi >= 11) {
      return uvIndex = 'Extremo';
    } else {
      uvIndex = 'Unknown';
    }
    return uvIndex;
  }
}

// ignore: missing_return
String convertToDay(String day) {
  switch (day) {
    case 'Wed':
      return "Quarta";

    case 'Thu':
      return "Quinta";

    case 'Fri':
      return "Sexta";

    case 'Sat':
      return "Sábado";

    case 'Sun':
      return "Domingo";

    case 'Mon':
      return "Segunda";

    case 'Tue':
      return "Terça";
  }
}

class WeatherUtils {
  static List<Color> getColor({var weatherType}) {
    if (weatherType == '01d') {
      return [Color(0xFF0071D1), Color(0xFF6DA6E4)];
    } else if (weatherType == '01n') {
      return [Color(0xFF061E74), Color(0xFF275E9A)];
    } else if (weatherType == '03d') {
      return [Color(0xFF8FA3C0), Color(0xFF8C9FB1)];
    } else if (weatherType == '03n') {
      return [Color(0xFF2C3A60), Color(0xFF4B6685)];
    } else if (weatherType == '04d') {
      return [
        Color.fromARGB(255, 144, 148, 151),
        Color.fromARGB(255, 144, 148, 151),
      ];
    } else if (weatherType == '04n') {
      return [Color(0xFF2C3A60), Color(0xFF4B6685)];
    } else if (weatherType == '50d') {
      return [Color(0xFFA6B3C2), Color(0xFF737F88)];
    } else if (weatherType == '50n') {
      return [Color(0xFFA6B3C2), Color(0xFF737F88)];
    } else if (weatherType == '13d') {
      return [Color(0xFF6989BA), Color(0xFF9DB0CE)];
    } else if (weatherType == '13n') {
      return [Color(0xFF6989BA), Color(0xFF9DB0CE)];
    } else if (weatherType == '11d') {
      return [Color(0xFF3B434E), Color(0xFF565D66)];
    } else if (weatherType == '11n') {
      return [Color(0xFF3B434E), Color(0xFF565D66)];
    } else if (weatherType == '10d') {
      return [Color.fromARGB(255, 56, 68, 85), Color.fromARGB(255, 68, 80, 90)];
    } else if (weatherType == '10n') {
      return [Color(0xFF556782), Color(0xFF7c8b99)];
    } else if (weatherType == '02d') {
      return [Color(0xFFA6B3C2), Color(0xFF737F88)];
    } else if (weatherType == '02n') {
      return [Color(0xFFA6B3C2), Color(0xFF737F88)];
    } else {
      return [Color(0xFF0071D1), Color(0xFF6DA6E4)];
    }
  }

  static Color getColorBar({var weatherType}) {
    if (weatherType == '01d') {
      return Color(0xFF0071D1);
    } else if (weatherType == '01n') {
      return Color(0xFF061E74);
    } else if (weatherType == '03d') {
      return Color(0xFF8FA3C0);
    } else if (weatherType == '03n') {
      return Color(0xFF2C3A60);
    } else if (weatherType == '04d') {
      return Color(0xFF737F88);
    } else if (weatherType == '04n') {
      return Color(0xFF2C3A60);
    } else if (weatherType == '50d') {
      return Color(0xFFA6B3C2);
    } else if (weatherType == '50n') {
      return Color(0xFFA6B3C2);
    } else if (weatherType == '13d') {
      return Color(0xFF6989BA);
    } else if (weatherType == '13n') {
      return Color(0xFF6989BA);
    } else if (weatherType == '11d') {
      return Color(0xFF3B434E);
    } else if (weatherType == '11n') {
      return Color(0xFF3B434E);
    } else if (weatherType == '10d') {
      return Color(0xFF556782);
    } else if (weatherType == '10n') {
      return Color.fromARGB(202, 71, 80, 95);
    } else if (weatherType == '02d') {
      return Color(0xFFA6B3C2);
    } else if (weatherType == '09d') {
      return Color(0xFF556782);
    } else if (weatherType == '09n') {
      return Color(0xFF556782);
    } else if (weatherType == '02n') {
      return Color.fromARGB(255, 128, 147, 177);
    } else {
      return Color(0xFF0071D1);
    }
  }
}
