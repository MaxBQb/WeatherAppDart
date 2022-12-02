import 'package:flutter/material.dart';
import 'package:weather_app/features/geolocation/presentation/pages/location/page.dart';

import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WeatherApp',
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          colorScheme: const ColorScheme.dark(
            primary: Colors.deepOrange,
            secondary: Colors.deepOrange,
          )
      ),
      home: const LocationPage(),
      routes: {
        '/location': (context) => const LocationPage(),
      },
    );
  }
}
