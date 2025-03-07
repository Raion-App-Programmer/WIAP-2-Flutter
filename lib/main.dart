import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:html' as html;

import 'router.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  if (kIsWeb) {
    final apiKey = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';
    final script = html.ScriptElement()
      ..type = 'text/javascript'
      ..src = 'https://maps.googleapis.com/maps/api/js?key=$apiKey'
      ..defer = true;
    html.document.head!.append(script);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Google Maps Demo',
      routerConfig: router,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
