import 'package:flutter/material.dart';
import 'package:most_popular_articales/app/app.dart';
import 'package:most_popular_articales/app/di.dart';
import 'package:most_popular_articales/data/network/dio_helper.dart';
//Popular Articles
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.Init();
  await initAppModule();
  runApp(const MyApp());
}


