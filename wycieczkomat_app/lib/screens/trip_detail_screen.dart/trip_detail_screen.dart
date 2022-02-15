import 'package:flutter/material.dart';


import 'package:wycieczkomat_app/data.dart';

import 'package:wycieczkomat_app/screens/trip_detail_screen.dart/widgets/description_widget.dart';
import 'package:wycieczkomat_app/screens/trip_detail_screen.dart/widgets/icons_widget.dart';
import 'package:wycieczkomat_app/screens/trip_detail_screen.dart/widgets/main_image_widget.dart';
import 'package:wycieczkomat_app/screens/trip_detail_screen.dart/widgets/pictures_widget.dart';

class TripDetailScreen extends StatelessWidget {
  const TripDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/trip-detail';

  @override
  Widget build(BuildContext context) {
    final tripArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final tripId = tripArgs['tripId'];
    final coutryInfoText = tripArgs['countryInfoText'];
    final trasportType = tripArgs['trasportType'];
    final selectedTrip =
        DATA_TRIP.firstWhere((element) => element.id == tripId);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainImageWidget(
            selectedTrip: selectedTrip,
            coutryInfoText: coutryInfoText,
          ),
          SizedBox(height: 10),
          IconsWidget(transport: trasportType),
          SizedBox(height: 30),
          DescriptionWidget(selectedTrip: selectedTrip),
          SizedBox(height: 30),
          PicturesWidget(selectedTrip: selectedTrip),
        ],
      ),
    );
  }
}
