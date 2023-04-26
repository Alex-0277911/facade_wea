// використання шаблону "facade" у Dart для отримання погодних даних з API:

// У цьому прикладі клас WeatherApi відповідає за виконання запиту до API для
// отримання погодних даних. Клас WeatherFacade виступає як простий інтерфейс
// до класу WeatherApi, надаючи два методи для отримання поточної температури
// та опису погоди. У функції main створюються екземпляри обох класів та
// використовуються методи фасаду для отримання даних. Таким чином, складність
// взаємодії з API прихована за простим інтерфейсом, що полегшує використання та підтримку коду.

import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApi {
  final String _apiKey = 'd7f3fb73c94b0165061b6b96fc397852';
  final String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  final String _cityName = 'Dnipro';
  Future<Map<String, dynamic>> getCurrentWeather() async {
    final url = '$_baseUrl?q=$_cityName&appid=$_apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}

class WeatherFacade {
  final WeatherApi _weatherApi;

  WeatherFacade(this._weatherApi);

  Future<String> getCurrentTemperature() async {
    final weatherData = await _weatherApi.getCurrentWeather();
    final temp = weatherData['main']['temp'];
    return '$temp°C';
  }

  Future<String> getCurrentDescription() async {
    final weatherData = await _weatherApi.getCurrentWeather();
    final description = weatherData['weather'][0]['description'];
    return description;
  }
}

void main() async {
  final weatherApi = WeatherApi();
  final weatherFacade = WeatherFacade(weatherApi);

  final temp = await weatherFacade.getCurrentTemperature();
  final description = await weatherFacade.getCurrentDescription();

  print('Location: ${weatherApi._cityName}');
  print('Current temperature: $temp');
  print('Current weather description: $description');
}
