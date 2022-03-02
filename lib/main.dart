import 'package:flutter/material.dart';

import 'screens/home_page.dart';
import 'screens/country_details.dart';

void main() {
  runApp(
    MaterialApp(initialRoute: '/', routes: {
      '/': (context) => MyApp(),
      '/country': (context) => CountryDetails(),
    }),
  );
}
