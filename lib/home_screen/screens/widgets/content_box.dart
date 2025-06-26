import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contentbox extends StatefulWidget {
  final String humid;

  final String pressure;
  final String windspeed;

  const Contentbox({
    super.key,
    required this.humid,
    required this.pressure, required this.windspeed
  });

  @override
  State<Contentbox> createState() => _ContentboxState();
}

class _ContentboxState extends State<Contentbox> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.blue,
      elevation: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(30),
      ),

      child: Align(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsetsGeometry.symmetric(vertical: 21),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white70,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset('assets/barometer.png', height: 26, width: 25),
                  Text(
                    '${widget.pressure.toString()}millibar',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text('Pressure', style: TextStyle(color: Colors.grey)),
                ],
              ),
              SizedBox(width: 25),
              Column(
                children: [
                  Image.asset(
                    'assets/water-droplet.png',
                    height: 26,
                    width: 25,
                  ),
                  Text(
                    '${widget.humid.toString()}%',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text('Humidity', style: TextStyle(color: Colors.grey)),
                ],
              ),
              SizedBox(width: 25),
              Column(
                children: [
                  Image.asset('assets/wind.png', height: 26, width: 25),
                  Text(
                    '${widget.windspeed.toString()}Km/h',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text('Wind speed', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
