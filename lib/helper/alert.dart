import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alert {

  IconData icon;
  String title;
  String subtitle;

  Alert({ this.icon, this.title, this.subtitle });

  void show(BuildContext context) {
    showDialog(context: context, barrierDismissible: true, builder: (BuildContext context) {
      return _getAlertDialog(context);
    });
  }


  Widget _getAlertDialog(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: Icon(icon),
        content: Text(title, style: TextStyle(fontSize: 11.0), textAlign: TextAlign.center,),
      );
    } else {
      return AlertDialog(
        title: Icon(icon, size: 30.0, ),
        content: Text(title, style: TextStyle(fontSize: 11.0), textAlign: TextAlign.center,),
      );
    }
  }
}