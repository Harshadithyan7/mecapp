import 'package:flutter/material.dart';
import 'package:mecapp/home_screen/screens/home_screen.dart';
import 'package:mecapp/home_screen/screens/service/save_login_info.dart';
import 'package:mecapp/widgets/custom_button.dart';

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
    if (checkLogin == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Container(width: double.infinity, height: 400, color: Colors.red),
              SizedBox(height: height / 2, width: double.infinity),
              Text(
                "Weather \n Forecasts",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: height / 4),
              CustomButton(
                buttonTitle: "Get Start",
                hexColor: Colors.amber,
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
      ),
    );
  }
}
