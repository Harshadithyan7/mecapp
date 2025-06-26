import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveLoginInfo() async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  debugPrint('buttom pressed.....');

  await prefs.setBool('login', true);
}

Future<bool?> checkLoginInfo() async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? login = prefs.getBool('login');
  debugPrint('getting the boolean value........');
  return login;
}


