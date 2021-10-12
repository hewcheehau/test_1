import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String name = "Welcome";
  Color mainColor = Colors.indigoAccent;

 void changeSomething(String newName, {clr}) {
    name = newName;
    mainColor = clr??Colors.lightBlue;
    notifyListeners();
 }

}