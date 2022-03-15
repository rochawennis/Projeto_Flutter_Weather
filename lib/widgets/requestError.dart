import 'package:flutter/material.dart';

class RequestError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [SizedBox(height: 150),
          Icon(
         Icons.wrong_location_outlined,
            color: Colors.black,
            size: 100,
          ),
          SizedBox(height: 10),
          Text(
            'Nenhum Resultado',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 10),
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
        ]
      )
    );
  }
}


