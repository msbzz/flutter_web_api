import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  Progress({Key? key, 
  this.message = 'loading', 
  this.iconSize = 64,
  this.fontSize = 24,
  this.icon}) : super(key: key);
  final IconData? icon;
  final String message;
  final double iconSize;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Visibility(
            visible: true, 
            child:icon != null? 
            Icon(
              icon,
              size: iconSize,
            )
            :
            CircularProgressIndicator()
            ),
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(message,style:TextStyle(fontSize:fontSize ),textAlign: TextAlign.center,),
          )
        ],
      ),
    );
  }
}
