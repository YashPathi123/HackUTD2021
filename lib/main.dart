//import 'dart:js';
import 'package:intact/login.dart';
import 'package:flutter/material.dart';
import 'package:intact/forum.dart';
import 'package:intact/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Login(),
      '/forum': (context) => Forum(),
      //'/post': (context) => Post(),
      '/home': (context) => Home(), 
    
    },

  ));
}