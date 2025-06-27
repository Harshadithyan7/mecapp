import 'package:flutter/material.dart';
import 'package:mecapp/home_screen/screens/home_screen.dart';
import 'package:mecapp/home_screen/screens/service/save_login_info.dart';
import 'package:mecapp/utilities/theme/color_theme.dart';
import 'package:mecapp/widgets/custom_button.dart';

import '../../utilities/common_class/common_class.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void initState() {
    checkLoggedIn();
    super.initState();
  }

  checkLoggedIn() async {
    bool? checkLogin = await checkLoginInfo();
    debugPrint('checkLogIn runnning.........$checkLogin');
    // if (checkLogin == true) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => HomeScreen()),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: colorTheme.blue,
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 8, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            //Container(width: double.infinity, height: 400, color: Colors.red),
            Opacity(
              opacity: 0.8,
              child: Text(
                "Weather \n Forecasts",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: colorTheme.white,
                ),
              ),
            ),

            SizedBox(
              height: height / 3.1,
              width: double.infinity,
              child: Image.asset(imageLocations.sunWithCloudPng),
            ),

            SizedBox(
              width: double.infinity,
              child: Center(
                child: Text(
                  '"Moments change like the sky, \nBut you’ll always know what’s next, \nStart your day with clarity."',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 2,
                    fontSize: 17,
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            CustomButton(
              buttonTitle: "Get Start",
              hexColor: colorTheme.amber,
              onPress: () {
                saveLoginInfo();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
