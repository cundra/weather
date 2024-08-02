import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather.dart'; // Ganti dengan path yang sesuai
import 'package:weatherapp/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherServices('23d435657a59c5933d52cd0055266bd8');
  Weather? _weather;

  Future<void> fetchWeather() async {
    try {
      String cityName = await _weatherService.getCurrentCity();
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainAxisAlignment: MainAxisAlignment.Center,
            // City name
            Text(_weather?.main ?? "Loading city..."),
            // Temperature
            Text('${_weather?.temp?.round() ?? "Loading..."}°C'),
          ],
        ),
      ),
    );
  }
}
