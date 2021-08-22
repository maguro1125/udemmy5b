import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemmy5b/di/providers.dart';
import 'package:udemmy5b/view/screens/home_screen.dart';



void main() {
  runApp(
    MultiProvider(
      providers: globalProviders,
      child: MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NewsFeed",
      theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: "BoldFont"
      ),
      home: HomeScreen(),
    );
  }
}
