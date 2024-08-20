import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transanction.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  save(Transaction(350.0,Contact(0,'marcela',4000))).then((transaction)=>print('>>> adicionado : ${transaction.toString()}  <<<'));
  //findAll().then((transactions)=> print('new transactions ${transactions}'));
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
