import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
 
 Progress({Key? key,this.message='loading'}): super(key:key) ;
 
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[CircularProgressIndicator(), Text(message)],
      ),
    );
  }
}
