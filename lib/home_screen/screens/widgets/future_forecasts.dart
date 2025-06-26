import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../service/model/home_screen_model.dart';

class FutureForecasts extends StatefulWidget {
  final List<LiveLocation> futureForecastList;

  const FutureForecasts({super.key, required this.futureForecastList});

  @override
  State<FutureForecasts> createState() => _FutureForecastsState();
}

class _FutureForecastsState extends State<FutureForecasts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Today'),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text('7-Day Forecasts'),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ],
        ),

        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 6,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(3, 5, 3, 0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.futureForecastList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Container(
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [Color(0xFF0081FF), Color(0xFF5CB2DC)],
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding: EdgeInsets.all(5),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    widget.futureForecastList[index].time ??
                                        '0',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    widget.futureForecastList[index].date ??
                                        '0',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Image.asset(
                                    widget.futureForecastList[index].imageLoc,
                                    height: 55,
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${widget.futureForecastList[index].temp.substring(0, 2)}\u00B0',
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
