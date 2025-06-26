import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonTitle;
  final Color hexColor;
  final Function() onPress;

  const CustomButton({
    super.key,
    required this.buttonTitle,
    required this.hexColor,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: hexColor,
      ),
      width: double.infinity,
      child: TextButton(
        onPressed: onPress,
        child: Text(buttonTitle, style: TextStyle(color: Colors.white,fontSize: 18)),
      ),
    );
  }
}
