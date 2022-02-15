import 'package:flutter/cupertino.dart';
import 'package:wycieczkomat_app/models/activity.dart';
import 'package:wycieczkomat_app/models/enums.dart';
import 'package:wycieczkomat_app/models/place.dart';

import 'package:wycieczkomat_app/models/user_trip.dart';

class UserTrips with ChangeNotifier {
  List<UserTrip> _items = [
    UserTrip(
      personalOpinion: 'Very Good Trip',
      transportType: TransportType.Plane,
      id: 'ut1',
      name: 'Wakacje w górach',
      accomodation: Accomodation.Tent,
      activities: [
        Activity(
          category: 'sport',
          name: 'Running',
        ),
        Activity(
          category: 'sport',
          name: 'Swimming in lake',
        ),
      ],
      pictures: [
        'https://i.ytimg.com/vi/8km3PSOAfLA/maxresdefault.jpg',
      ],
      place: Place(
        city: 'Zakopane',
        country: Country.Poland,
        description: 'Quiet and peaceful in Mountains',
        safetyLevel: 'Safety',
      ),
      description: 'This is trip witch takes you to beautiful Poland mountains',
      rating: 5,
      price: 459,
    ),
    UserTrip(
      personalOpinion: 'Bad Trip',
      transportType: TransportType.Bus,
      id: 'ut2',
      name: 'Wakacje pod palmami',
      accomodation: Accomodation.HotelRoom,
      activities: [
        Activity(
          category: 'sport',
          name: 'Swimming in pool',
        ),
        Activity(
          category: 'entertainment',
          name: 'Watching Movies',
        ),
      ],
      pictures: [
        'https://wlochy.edu.pl/wp-content/uploads/2019/09/Rzym-panorama.jpg',
      ],
      place: Place(
        city: 'Rzym',
        country: Country.Italy,
        description: 'Quiet and peaceful',
        safetyLevel: 'Safety',
      ),
      description: 'This is trip witch takes you to beautiful and sunny Rome',
      rating: 4,
      price: 119,
    ),
  ];
  List<UserTrip> get items {
    return [..._items];
  }

  void addUserTrip(UserTrip userTrip) {
    final newUserTrip = UserTrip(
      personalOpinion: userTrip.personalOpinion,
      transportType: userTrip.transportType,
      id: DateTime.now().toString(),
      accomodation: userTrip.accomodation,
      activities: userTrip.activities,
      description: userTrip.description,
      name: userTrip.name,
      pictures: userTrip.pictures,
      place: userTrip.place,
      price: userTrip.price,
      rating: userTrip.rating,
    );
    _items.add(newUserTrip);
    notifyListeners();
  }

  void deleteUserTrip(String userTripId) {
    _items.removeWhere((userTrip) => userTrip.id == userTripId);
    notifyListeners();
  }
}
