import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mecapp/utilities/common_class/common_class.dart';

import 'model/home_screen_model.dart';

forecastService(final double lat, final double lng) async {
  try {
    var dio = Dio();
    dio.options.contentType = Headers.jsonContentType;
    List<LiveLocation> forecastData = [];
    var response = await dio.get(
      networkList.forecast,
      queryParameters: {
        // 'lon': lng,
        // 'lat': lat,
        // 'appid': 'e8f906423d1966d2736a4b39f0f9a386',
        // 'units': 'metric',
      },
    );
    for (var hourlyUpdate in response.data['list']) {
      forecastData.add(
        LiveLocation(
          imageLoc: getWeatherIcon(
            hourlyUpdate['weather'][0]['main'].toString(),
          ),
          name: '',
          humidity: hourlyUpdate['main']['humidity'].toString(),
          temp: hourlyUpdate['main']['temp'].toString(),
          pressure: hourlyUpdate['main']['pressure'].toString(),
          wind: hourlyUpdate['wind']['speed'].toString(),
          weatherDescrip: hourlyUpdate['weather'][0]['description'].toString(),
          date: DateFormat(
            'Md',
          ).format(DateTime.parse(hourlyUpdate['dt_txt'])).toString(),
          time: DateFormat(
            'jm',
          ).format(DateTime.parse(hourlyUpdate['dt_txt'])).toString(),
        ),
      );
    }
    debugPrint('date.....${forecastData[0].date}');
    debugPrint('time.....${forecastData[0].time}');
    return forecastData;
  } catch (e) {
    debugPrint('catch in FutureForecast.......$e');
    return [];
  }
}

Future<List<LiveLocation>> getData(final double lat, final double lng) async {
  var dio = Dio();
  List<LiveLocation> data = [];
  try {
    dio.options.contentType = Headers.jsonContentType;
    var response = await dio.get(
      networkList.weather,
      queryParameters: {
        // 'lon': lng,
        // 'lat': lat,
        // 'appid': 'e8f906423d1966d2736a4b39f0f9a386',
        // 'units': 'metric',
      },
    );

    data.add(
      LiveLocation(
        name: response.data['name'].toString(),
        humidity: response.data['main']['humidity'].toString(),
        pressure: response.data['main']['pressure'].toString(),
        temp: response.data['main']['temp'].toString(),
        wind: response.data['wind']['speed'].toString(),
        imageLoc: getWeatherIcon(response.data['weather'][0]['main']),
        weatherDescrip: response.data['weather'][0]['description'].toString(),
      ),
    );
    debugPrint('name.....${data[0].name}');
    debugPrint('humidity.....${data[0].humidity}');
    debugPrint('pressure.....${data[0].pressure}');
    debugPrint('temperature.....${data[0].temp} ');
    debugPrint('windspeed.....${data[0].wind}');
    debugPrint('weatherDescription.....${data[0].weatherDescrip}');
    debugPrint('mainText.....${response.data['weather'][0]['main']}');
    debugPrint('ImageLocation.....${data[0].imageLoc}');
    return data;
  } catch (e) {
    debugPrint("getData() function in catch->>> $e");
    return [];
  }
}

String getWeatherIcon(final String main) {
  switch (main) {
    case 'Clear':
      return imageLocations.clearSkyPng;
    case 'Clouds':
      return imageLocations.cloudyPng;
    case 'Drizzle':
      return imageLocations.drizzlePng;
    case 'Mist' || 'Fog' || 'Haze':
      return imageLocations.mistyPng;
    case 'Snow':
      return imageLocations.snowyPng;
    case 'Rain':
      return imageLocations.rainyPng;
    case 'Thunderstorm':
      return imageLocations.thunderStormPng;
  }
  return imageLocations.clearSkyPng;
}
