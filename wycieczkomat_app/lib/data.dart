import 'package:wycieczkomat_app/models/place.dart';
import 'package:wycieczkomat_app/models/trip.dart';
import 'models/activity.dart';
import 'models/enums.dart';

List<Trip> DATA_TRIP = [
  Trip(
    id: 't1',
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
      'https://d2p8izc34jqpsy.cloudfront.net/media/mainphoto/ba32a5bd-bcb8-43c1-813f-a43cedc0cdcb.jpg?d=1766x916',
      'https://www.gannett-cdn.com/presto/2021/07/07/USAT/ff8de4c6-f511-4a14-99a7-78dbe6869c74-GettyImages-1131890997.jpg?width=960',
    ],
    place: Place(
      city: 'Rzym',
      country: Country.Italy,
      description: 'Quiet and peaceful',
      safetyLevel: 'Safety',
    ),
    description:
        'Ta wycieczka zabierze cię w do Rzymu, w którym przeżyjesz niezapomniane widoki oraz wrócisz wypoczęty do domu.',
    rating: 4,
    price: 259,
    transportType: TransportType.Plane,
  ),
  Trip(
    id: 't2',
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
      'https://i.redd.it/z4gkx9qorna31.jpg',
      'https://podroze.smcloud.net/t/image/t/133466/gory-w-polsce-tatry_340318.jpg',
      'https://i.ytimg.com/vi/8km3PSOAfLA/maxresdefault.jpg',
    ],
    place: Place(
      city: 'Zakopane',
      country: Country.Poland,
      description: 'Quiet and peaceful',
      safetyLevel: 'Safety',
    ),
    description:
        'Ta wycieczka zabierze cię w do Zakopanego, w którym przeżyjesz niezapomniane widoki oraz wrócisz wypoczęty do domu.',
    rating: 5,
    price: 379,
    transportType: TransportType.Bus,
  ),
  Trip(
      id: 't3',
      name: 'Wakacje w pięknej Hiszpanii',
      accomodation: Accomodation.HotelRoom,
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
        'https://api.zielonamapa.pl/storage/wp-content/uploads/2020/06/madryt-500x333.jpg',
        'https://blogerasmus.pl/wp-content/uploads/2020/05/m1.jpg',
        'https://hispanico.pl/wp-content/uploads/2018/01/plaza-de-cibeles-madryt-hiszpania.jpg',
      ],
      place: Place(
        city: 'Madryt',
        country: Country.Spain,
        description: 'Beautiful Madrid City',
        safetyLevel: 'Safety',
      ),
      description:
          'Ta wycieczka zabierze cię w do Madrytu, w którym przeżyjesz niezapomniane widoki oraz wrócisz wypoczęty do domu.',
      rating: 5,
      price: 1299,
      transportType: TransportType.Train),
];
