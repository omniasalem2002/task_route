import 'dart:io';
import 'package:flutter/material.dart';
import 'package:route_task/data/repos/home_repos/data_sources/home_online_ds_impl.dart';
import 'package:route_task/domain/di/di.dart';
import 'package:route_task/ui/screens/home/home_screen.dart';

void main() {
  configureDependencies();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}

