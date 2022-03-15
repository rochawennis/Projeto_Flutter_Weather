class TemperatureData {
   DateTime time;
   double temperature;
   String weather;
   String weatherIcon;

  TemperatureData(
      { this.time,
       this.temperature,
       this.weather,
       this.weatherIcon});
  Map<String, dynamic> toJSON() {
    return {
      'time': time.toString(),
      'temperature': temperature,
      'weather': weather,
      'weatherIcon': weatherIcon
    };
  }
}

class TemperatureChartData {
   String time;
   double temperature;
   String weather;
   String weatherIcon;

  TemperatureChartData(
      { this.time,
       this.temperature,
       this.weather,
       this.weatherIcon});
  Map<String, dynamic> toJSON() {
    return {
      'time': time,
      'temperature': temperature,
      'weather': weather,
      'weatherIcon': weatherIcon
    };
  }
}
