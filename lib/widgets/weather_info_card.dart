import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:liveweatherbloc/apis/Weather.dart';

class DisplayWeather extends StatelessWidget {
  final Weather mausam;

  const DisplayWeather({Key? key, required this.mausam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        SizedBox(
          height: size.height * 0.09,
        ),
        const Text(
          "TODAY",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Text(
          "${mausam.location?.name}, ${mausam.location?.country}",
          style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
        ),
        SizedBox(
          height: size.height * 0.08,
        ),
        Container(
          //color: Colors.blue,
          height: size.height * 0.3,
          width: size.height * 0.3,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(kIsWeb
                      ? "${mausam.current?.condition?.icon}"
                      : "http:${mausam.current?.condition?.icon}"),
                  fit: BoxFit.cover)),
        ),
        Text(
          "${mausam.current?.tempC}° C",
          style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Text(
          "${mausam.current?.condition?.text}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
