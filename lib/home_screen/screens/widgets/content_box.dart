import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecapp/home_screen/screens/widgets/extra_info_call.dart';
import 'package:mecapp/utilities/theme/color_theme.dart';

import '../../../utilities/common_class/common_class.dart';

class ContentBox extends StatefulWidget {
  final String humid;

  final String pressure;
  final String windSpeed;

  const ContentBox({
    super.key,
    required this.humid,
    required this.pressure,
    required this.windSpeed,
  });

  @override
  State<ContentBox> createState() => _ContentBoxState();
}

class _ContentBoxState extends State<ContentBox> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: colorTheme.blue,
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
              ExtraInfoCall(extraInfoValue: widget.pressure,
                  extraInfoUnit: 'millibar',
                  extraInfoName: 'Pressure',
                  extraInfoIcon: imageLocations.pressureIconPng),
              SizedBox(width: 25),
              ExtraInfoCall(
                extraInfoUnit: '%',
                extraInfoName: 'Humidity',
                extraInfoIcon: imageLocations.waterDropletPng,
                extraInfoValue: widget.humid,
              ),
              SizedBox(width: 25),
              ExtraInfoCall(
                extraInfoValue: widget.windSpeed,
                extraInfoUnit: 'Km/h',
                extraInfoName: 'Wind speed',
                extraInfoIcon: imageLocations.windIconPng,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
