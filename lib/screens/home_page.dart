import 'package:flutter/material.dart';

import '../models/country.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Country> countries = [];

  var numberOfCountries = 50;

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < numberOfCountries; i++) {
      var country = Country();
      countries.add(country);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID Stats'),
      ),
      body: ListView.builder(
          itemCount: numberOfCountries,
          itemBuilder: (context, ind) {
            var c = countries[ind];
            return ListTile(
              leading: IconButton(
                icon: c.favorited ? Icon(Icons.star) : Icon(Icons.star_border),
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    c.toggleFavorited();
                  });
                },
              ),
              title: Text(c.getName()),
              trailing: Column(
                children: [
                  Text('Infection Rate'),
                  CircleAvatar(
                    child: Text(c.infectionRatePercentage()),
                  ),
                ],
              ),
              subtitle: Text('Death rate: ${c.deathRatePercentage()}'),
              onLongPress: () {
                setState(() {
                  c.refreshCountry();
                });
              },
              onTap: () async {
                var favorited =
                    await Navigator.pushNamed(context, '/country', arguments: c)
                        as bool;
                setState(() {
                  c.favorited = favorited;
                });
              },
            );
          }),
    );
  }
}
