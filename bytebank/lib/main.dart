 
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
    runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
return MaterialApp(
  theme: ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.green[900],
      secondary: Colors.blueAccent[700], // Substitui accentColor
    ),
    scaffoldBackgroundColor: Colors.white,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blueAccent[700],
      textTheme: ButtonTextTheme.primary,
    ),
  ),
  home: Dashboard(),
);
  }
}
