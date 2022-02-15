import 'package:wycieczkomat_app/models/activity.dart';

import 'package:wycieczkomat_app/models/trip.dart';

import 'enums.dart';

// class UserTrip {
//   final Trip trip;
//   final String personalOpinion;
//   final TransportType transportType;

//   UserTrip({
//     required this.personalOpinion,
//     required this.transportType,
//     required this.trip,
//   });
// }

class UserTrip extends Trip {
  var personalOpinion;

  UserTrip({
    required this.personalOpinion,
    required String id,
    required var name,
    required var description,
    required var pictures,
    required var place,
    required var transportType,
    required Accomodation accomodation,
    required List<Activity> activities,
    required int rating,
    required double price,
  }) : super(
          id: id,
          accomodation: accomodation,
          activities: activities,
          description: description,
          name: name,
          pictures: pictures,
          place: place,
          price: price,
          rating: rating,
          transportType: transportType,
        );
}
