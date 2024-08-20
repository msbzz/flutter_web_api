import 'package:flutter/material.dart';

void ShowSnackBar(BuildContext context, String message,{bool isError=false}) {
 
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: isError? Colors.redAccent: Colors.green,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}