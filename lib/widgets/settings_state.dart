import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

enum TemperatureUnit { fahrenheit, celsius }

bool celsius = true;

class SettingsState extends Equatable {
  final TemperatureUnit temperatureUnit;
  const SettingsState({@required this.temperatureUnit})
      : assert(temperatureUnit != null);
  @override
  List<Object> get props => [temperatureUnit];
}
