import 'package:flutter/material.dart';
import 'package:most_popular_articales/app/app.dart';
import 'package:most_popular_articales/app/di.dart';
//Popular Articles
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(const MyApp());
}


