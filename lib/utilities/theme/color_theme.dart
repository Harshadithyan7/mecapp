import 'package:flutter/material.dart';

class ColorTheme {
  Color blue = Color(0xFF1b8cfb);
  Color amber = Colors.amber;
  Color white = Colors.white;
  Color lighblue = Colors.lightBlue;
}

class ImageLocation {
  String sunPng = 'assets/sun.jpeg';
  String sunWithCloudPng = 'assets/sun-behind-large-cloud.png';
  String pinIconPng = 'assets/pin.png';
  String clearSkyPng = 'assets/foreground/clear.png';
  String cloudyPng = 'assets/foreground/clouds.png';
  String drizzlePng = 'assets/foreground/drizzle.png';
  String mistyPng = 'assets/foreground/mist.jpg';
  String snowyPng = 'assets/foreground/snow.png';
  String rainyPng = 'assets/foreground/rain.png';
  String thunderStormPng = 'assets/foreground/thunderstorm.png';
  String waterDropletPng = 'assets/water-droplet.png';
  String windIconPng = 'assets/wind.png';
  String pressureIconPng = 'assets/barometer.png';
}

class VariousTextStyle {
  TextStyle mainTemp = TextStyle(
    color: ColorTheme().white,
    fontSize: 120,
    fontWeight: FontWeight.bold,
    height: 1,
  );
  TextStyle weatherDescription = TextStyle(color: Colors.white70);
  TextStyle extraInfo = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
  TextStyle extraInfoDescription = TextStyle(color: Colors.grey);
}
