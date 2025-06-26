class LiveLocation {
  final String name;
  final String humidity;
  final String pressure;
  final String temp;
  final String wind;
  final String imageLoc;
  final String? date;
  final String? time;

  final String weatherDescrip;

  const LiveLocation({
    required this.imageLoc,
    required this.name,
    required this.humidity,
    required this.temp,
    required this.pressure,
    required this.wind,
    required this.weatherDescrip,
    this.date,
    this.time,
  });
}
