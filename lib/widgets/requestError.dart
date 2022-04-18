import 'package:flutter/material.dart';
import 'package:flutter_weather/widgets/searchBar.dart';

class RequestError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20), child: SearchBar()),
        SizedBox(height: 80),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.wrong_location_outlined,
              color: Colors.black,
              size: 100,
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Nenhum Resultado',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 75, vertical: 10),
              child: Text(
                "Verifique se você digitou o nome do local correto",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
