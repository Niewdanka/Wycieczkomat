
import 'enums.dart';

class Place {
  var city;
  final String description;
  final String safetyLevel;
  final Country country;

  Place({
    required this.city,
    required this.country,
    required this.description,
    required this.safetyLevel,
  });
}
