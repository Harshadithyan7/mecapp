import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utilities/common_class/common_class.dart';

class ShimmerWidget extends StatefulWidget {
  const ShimmerWidget({super.key});

  @override
  State<ShimmerWidget> createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<ShimmerWidget> {
  @override
  Widget build(BuildContext context) {
    debugPrint('ShimmerWidget is running....>>>>>>>>>');
    return SizedBox(
      width: double.infinity,
      height: 201,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Today', style: variousTextStyle.extraInfoDescription),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      '7-Day Forecasts',
                      style: variousTextStyle.extraInfoDescription,
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 6,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(3, 5, 3, 0),
                    child: Shimmer.fromColors(
                      loop: 5,
                      baseColor: Colors.white,
                      highlightColor: Colors.grey,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(50),
                                ),

                                alignment: Alignment.bottomCenter,
                                width: 90,
                                padding: EdgeInsets.all(5),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                ),
                              ),
                              SizedBox(width: 8),
                            ],
                          );
                        },
                      ),
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
