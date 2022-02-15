import 'package:wycieczkomat_app/models/place.dart';

import 'activity.dart';
import 'enums.dart';

class Trip {
  final String id;
  final String name;
  final String description;
  var pictures;
  final Place place;
  final Accomodation accomodation;
  final List<Activity> activities;
  final int rating;
  final double price;
  final TransportType transportType;

  Trip({
    required this.id,
    required this.name,
    required this.accomodation,
    required this.activities,
    required this.pictures,
    required this.place,
    required this.description,
    required this.rating,
    required this.price,
    required this.transportType,
  });
}
