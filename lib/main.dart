import 'package:apis/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';

import 'layout/news_app.dart';

void main() {
  Diohelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.amber),
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.brown[400],
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
            iconTheme: IconThemeData(color: Colors.black)),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.amber,
            elevation: 40.0),
      ),
      home: NewsLayout(),
    );
  }
}
