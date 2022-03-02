import 'package:flutter/material.dart';

import '../models/country.dart';

class CountryDetails extends StatefulWidget {
  @override
  State<CountryDetails> createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  late Country country;

  @override
  Widget build(BuildContext context) {
    country = ModalRoute.of(context)?.settings.arguments as Country;
    return Scaffold(
      appBar: AppBar(
        title: Text(country.getName()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(child: Text(country.infectionRatePercentage())),
          Center(
            child: IconButton(
              icon: country.favorited
                  ? Icon(Icons.star)
                  : Icon(Icons.star_border),
              color: Colors.red,
              onPressed: () {
                setState(() {
                  country.toggleFavorited();
                });
              },
            ),
          ),
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, country.favorited);
                  },
                  child: Text('Back')))
        ],
      ),
    );
  }
}
