import 'package:wycieczkomat_app/models/place.dart';

import 'activity.dart';
import 'enums.dart';

class Preferences {
  final double price;
  final Activity activity;
  final Accomodation accomodation;
  final Place place;
  final TransportType transportType;

  Preferences({
    required this.accomodation,
    required this.activity,
    required this.place,
    required this.price,
    required this.transportType,
  });
}
