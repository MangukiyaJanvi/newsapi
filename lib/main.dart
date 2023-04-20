import 'package:flutter/material.dart';
import 'package:newsapi/screens/homescreen/provider/home_provider.dart';
import 'package:newsapi/screens/homescreen/view/data_screen.dart';
import 'package:newsapi/screens/homescreen/view/home_screen.dart';
import 'package:newsapi/screens/homescreen/view/web_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomeScreen(),
          'data': (context) => DataScreen(),
          'web': (context) => WebScreen(),
        },
      ),
    ),
  );
}
