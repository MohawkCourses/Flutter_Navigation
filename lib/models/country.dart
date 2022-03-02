import 'package:faker/faker.dart';

class Country {
  late String _name;
  late int _population;
  late int _infectons;
  late int _deaths;
  bool favorited = false;

  Country() {
    var faker = Faker();
    _name = faker.address.country();
    _population = faker.randomGenerator.integer(100, min: 1) * 10000000;
    _infectons = faker.randomGenerator.integer(1000, min: 100) * 10000;
    _deaths = faker.randomGenerator.integer(10000, min: 100);
  }

  String getName() => _name;

  double infectionRate() => 100 * _infectons / _population;

  double deathRate() => 100 * _deaths / _infectons;

  String infectionRatePercentage() => infectionRate().toStringAsFixed(1) + '%';

  String deathRatePercentage() => deathRate().toStringAsFixed(1) + '%';

  refreshCountry() {
    _infectons = faker.randomGenerator.integer(1000, min: 100) * 10000;
    _deaths = faker.randomGenerator.integer(10000, min: 100);
  }

  addToFavorites() => favorited = true;

  toggleFavorited() {
    if (favorited) {
      favorited = false;
    } else {
      favorited = true;
    }
  }
}
