import 'package:flutter/material.dart';


class PlaceHolder extends StatelessWidget {
  const PlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        // Assets.appLogo,
        "",
        fit: BoxFit.cover,
      ),
    );
  }
}




