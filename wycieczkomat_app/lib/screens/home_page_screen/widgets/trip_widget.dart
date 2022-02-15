import 'package:flutter/material.dart';
import 'package:wycieczkomat_app/models/enums.dart';

import 'package:wycieczkomat_app/screens/trip_detail_screen.dart/trip_detail_screen.dart';

class TripWidget extends StatelessWidget {
  const TripWidget({
    Key? key,
    required this.tripId,
    required this.name,
    required this.city,
    required this.country,
    required this.rating,
    required this.imageUrl,
    required this.transportType,
  }) : super(key: key);

  final String tripId;
  final String name;
  final String city;
  final Country country;
  final int rating;
  final List<String> imageUrl;
  final TransportType transportType;

  String get coutryIntoText {
    switch (country) {
      case Country.Greece:
        return 'Grecja';
      case Country.Italy:
        return 'Włochy';
      case Country.Poland:
        return 'Polska';
      case Country.Spain:
        return 'Hiszpania';
    }
  }

  String get transportTypeInfoText {
    switch (transportType) {
      case TransportType.Bus:
        return 'Bus';
      case TransportType.Plane:
        return 'Samolot';
      case TransportType.Train:
        return 'Pociąg';
    }
  }

  void selectedTrip(BuildContext context) {
    Navigator.pushNamed(
      context,
      TripDetailScreen.routeName,
      arguments: {
        'tripId': tripId,
        'countryInfoText': coutryIntoText,
        'trasportType': transportTypeInfoText,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final image1 = imageUrl[0];

    return InkWell(
      onTap: () => selectedTrip(context),
      child: Container(
        margin: const EdgeInsets.all(15),
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              child: Image.network(
                image1,
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 60,
              left: 10,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black45,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      city,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Colors.grey[400],
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          coutryIntoText,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${rating.toString()}.0',
                        style: TextStyle(
                          color: Colors.yellow[800],
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
