import 'package:butterfly/data/weather.dart';
import 'package:flutter/material.dart';
import '../services/api_services.dart';
Weather result=Weather('', '', 0, 0, 0, 0);
class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather'),),
      body: Column(
        children: [
          ElevatedButton(onPressed: getData, child: Text('Get Weather Data')),
          Text(result.name + '\n'+ result.description)
        ],
      ),
    );
  }


  Future getData() async {
    HttpHelper helper = HttpHelper();
     result = await helper.getWeather('Osaka');
    setState((){
    });
  }
}
