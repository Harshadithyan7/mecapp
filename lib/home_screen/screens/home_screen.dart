import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mecapp/home_screen/screens/service/forecast_service.dart';
import 'package:mecapp/home_screen/screens/service/geolocation.dart';
import 'package:mecapp/home_screen/screens/service/model/home_screen_model.dart';
import 'package:mecapp/home_screen/screens/widgets/content_box.dart';
import 'package:mecapp/home_screen/screens/widgets/custom_container.dart';
import 'package:mecapp/home_screen/screens/widgets/future_forecasts.dart';
import 'package:mecapp/home_screen/screens/widgets/other_cities.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  var dio = Dio();
  List<LiveLocation> locDetails = [];
  List<LiveLocation> futureForecast = [];

  @override
  void initState() {
    locFetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/pin.png', height: 40, width: 30),
            SizedBox(width: 8),
            if (locDetails.isNotEmpty)
              Text(
                locDetails[0].name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
          ],
        ),
        // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50, width: double.infinity),
              CustomContainer(
                mainImageLocation: locDetails.isNotEmpty
                    ? locDetails[0].imageLoc
                    : 'assets/foreground/clear.png',
                temp: locDetails.isNotEmpty
                    ? locDetails[0].temp.substring(0, 2)
                    : '0',
                descrip: locDetails.isNotEmpty
                    ? locDetails[0].weatherDescrip
                    : 'null',
              ),
              SizedBox(height: 16),
              Contentbox(
                humid: locDetails.isNotEmpty ? locDetails[0].temp : '0',
                pressure: locDetails.isNotEmpty ? locDetails[0].pressure : ' 0',
                windspeed: locDetails.isNotEmpty ? locDetails[0].wind : "0",
              ),
              SizedBox(height: height / 20),
              FutureForecasts(futureForecastList: futureForecast),
              OtherCities(),
            ],
          ),
        ),
      ),
    );
  }

  locFetch() async {
    Position nowLocation = await currentLocation();

    locDetails = await getData(nowLocation.latitude, nowLocation.longitude);
    futureForecast = await forecastService(
      nowLocation.latitude,
      nowLocation.longitude,
    );

    setState(() {});
  }
}
