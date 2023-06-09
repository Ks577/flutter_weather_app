import 'dart:convert';
import 'package:flutter_weather/data/consts.dart';
import 'package:http/http.dart' as http;

const apiKey = '3102c28eba11f0b89ff05853110a20dc';

class FetchHelper {
  final String baseUrl;
  final String request;
  final String parameters;

  FetchHelper({
    this.baseUrl = Consts.baseUrl,
    this.request = Consts.getWeatherRequest,
    this.parameters = '',
  });

  Future<dynamic> getData() async {
    print('Request...');

    final fullUrl =
        'https://api.openweathermap.org/data/2.5/weather?lat=32.83299&lon=35.06989&appid,q=KiryatMotzkin&appid=$apiKey&units=metric';

    http.Response response = await http.get(Uri.parse(fullUrl));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print('Response:\n$body');
      return body;
    } else {
      print(response.statusCode);
    }
  }
}
