import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../provider/weatherProvider.dart';

class MainWeather extends StatelessWidget {
  final wData;

  MainWeather({this.wData});

  final TextStyle _style1 =
      TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    final weatherData = Provider.of<WeatherProvider>(context);
    var cidade = weatherData.weather.cityName;
    print(cidade);
    var tam = '${wData.weather.description}'.toString().length;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(25, 15, 25, 5),
        height: MediaQuery.of(context).size.height / 3.8,
        //width: MediaQuery.of(context).size.width,
        child: Flex(
          direction: Axis.vertical,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                ),
               Text('${wData.weather.cityName}' + ', ' + '${wData.weather.country}',style: _style1),
              ],
            ),
            //SizedBox(height: 10),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: SvgPicture.asset(
                        "lib/assets/${wData.weather.icon}.svg",
                        height: 90)
                    //Image.asset('lib/assets/' +'${wData.weather.icon.toString()}' + "@2x.png",height: 90)
                    ),
                Text(
                  '${wData.weather.temp.toStringAsFixed(0)}°C',
                  style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
            Text(
                '${wData.weather.description.toString().toUpperCase()[0] + wData.weather.description.toString().substring(1, tam)}',
                style: _style1.copyWith(fontSize: 19),
                textAlign: TextAlign.center),
            SizedBox(height: 10),
            Text(
                'Max: ${weatherData.currentWeather.tempMaxD.toStringAsFixed(0)}° | Min: ${weatherData.currentWeather.tempMinD.toStringAsFixed(0)}°',
                style: _style1.copyWith(fontSize: 19),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}