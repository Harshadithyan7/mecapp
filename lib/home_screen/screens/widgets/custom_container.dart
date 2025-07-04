import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mecapp/utilities/theme/color_theme.dart';

class CustomContainer extends StatefulWidget {
  final String temp;
  final String descrip;
  final String mainImageLocation;

  const CustomContainer({
    super.key,
    required this.temp,
    required this.descrip,
    required this.mainImageLocation,
  });

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        alignment: Alignment.center,
        width: 400,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsetsGeometry.symmetric(horizontal: 90),
              width: 250,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  colors: [ColorTheme().blue, ColorTheme().lighblue],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: Alignment(1, 0),
                    child: Text(
                      '${widget.temp}\u00B0',
                      style: VariousTextStyle().mainTemp
                    ),
                  ),
                  Align(
                    alignment: Alignment(.9, 0),
                    child: Text(
                      widget.descrip,
                      maxLines: 2,
                      softWrap: true,

                      style: VariousTextStyle().weatherDescription,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 35,
              bottom: -25,
              child: Image.asset(
                widget.mainImageLocation,
                height: 200,
                width: 180,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
