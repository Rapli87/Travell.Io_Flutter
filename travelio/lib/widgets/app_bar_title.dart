import 'package:flutter/material.dart';
import 'package:travel_io/res/custom_colors.dart';

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/41365931.png',
          height: 20,
        ),
        SizedBox(width: 8),
        Text(
          'Travell',
          style: TextStyle(
            color: CustomColors.firebaseAmber,
            fontSize: 18,
          ),
        ),
        Text(
          '.Io',
          style: TextStyle(
            color: CustomColors.firebaseOrange,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
