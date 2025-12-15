import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/module_2/class_2_button.dart';
import 'package:practice/module_8/Dashboard.dart';
import 'package:practice/module_8/cls3_grid.dart';
import 'package:practice/module_8/cls_1_input.dart';
import 'package:practice/module_8/cls_2.dart';
import 'package:practice/module_8/cls_3.dart';
import 'package:practice/module_9/cls_2.dart';
import 'package:practice/module_9/cls_2_stack.dart';
import 'package:practice/module_9/cls_3.dart';
import 'package:practice/module_9/theme_test.dart';

import 'home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //brightness: Brightness.dark,
        primaryColor: Colors.deepPurple,
        primarySwatch: Colors.deepPurple,
        //scaffoldBackgroundColor: Colors.blueGrey,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          )
        ),
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey,width: 2),
              ),

              focusedBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.orange,width: 2),
              ),
              hintStyle: TextStyle(
                color: Colors.grey
              ),
            ),

          textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          )
      )
      ),
      darkTheme: ThemeData.dark().copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            )
        ),
      ),
      themeMode: ThemeMode.light,
      title: 'Ibuuuuuu',
      home: ThemeTest(),
      initialRoute: 'widget',
      routes: {
        'home' : (context) => Home(phone: '01111'),
        'btns' : (context) => Buttongrp(),
        'login': (context)=> LoginPage(),
        'dash': (context)=> Dashboard(),
        'list': (context)=> FList(),
        'stack': (context)=> Cls2Stack(),
        'widget': (context)=> OwnWidget()
      },
    );
  }
}
