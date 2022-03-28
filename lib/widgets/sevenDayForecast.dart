import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../helper/utils.dart';
import '../models/dailyWeather.dart';

class SevenDayForecast extends StatelessWidget {
  final wData;
  final List<DailyWeather> dWeather;

  SevenDayForecast({this.wData, this.dWeather});

  Widget dailyWidget(dynamic weather, BuildContext context) {
    final dayOfWeek = DateFormat("EEE").format(weather.date);
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  convertToDay(dayOfWeek) ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: SvgPicture.asset("lib/assets/${weather.icon}.svg",
                      height: 70),
                ),
                Container(
                  width: 80,
                  child: Text(
                    "${weather.dailyTemp.toStringAsFixed(1)}°C",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var tam = '${wData.weather.description}'.toString().length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 8.5,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hoje',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        '${wData.weather.temp.toStringAsFixed(1)}°',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                          '${wData.weather.description.toString().toUpperCase()[0] + wData.weather.description.toString().substring(1, tam)}',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.white))
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: SvgPicture.asset(
                        "lib/assets/${wData.weather.icon}.svg",
                        width: 70,
                      )),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, top: 10),
          child: Text(
            'Próximos 7 dias',
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 3.5,
          //width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  dWeather.map((item) => dailyWidget(item, context)).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
