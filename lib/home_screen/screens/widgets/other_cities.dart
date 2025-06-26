import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class OtherCities extends StatefulWidget {
  const OtherCities({super.key});

  @override
  State<OtherCities> createState() => _OtherCitiesState();
}

class _OtherCitiesState extends State<OtherCities> {
  // Position? nowLocation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Other Cities'),
              IconButton(
                onPressed: ()  {
                  //
                  // debugPrint('latitude...${nowLocation?.latitude}');
                  // debugPrint('longitude...${nowLocation?.longitude}');
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 99,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(50),
                              ),
                              shadowColor: Colors.blue,
                              elevation: 10,
                              child: Container(
                                width: 230,
                                height: 100,
                                alignment: Alignment.bottomCenter,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xFF0081FF),
                                      Color(0xFF5CB2DC),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset(
                                      'assets/sun-behind-large-cloud.png',
                                      height: 89,
                                    ),

                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/pin.png',
                                              height: 25,
                                            ),
                                            Text(
                                              'Location',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Mostly Clear',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '22\u00B0',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
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
      ),
    );
  }
}
