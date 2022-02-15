import 'package:flutter/material.dart';

import 'package:wycieczkomat_app/models/trip.dart';
import 'package:wycieczkomat_app/screens/trip_detail_screen.dart/widgets/pictures.dart';

class PicturesWidget extends StatelessWidget {
  const PicturesWidget({
    Key? key,
    required this.selectedTrip,
  }) : super(key: key);

  final Trip selectedTrip;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Zdjęcia',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          height: 150,
          child: ListView.builder(
            itemBuilder: (ctx, i) => Pictures(
              picture: selectedTrip.pictures[i],
            ),
            itemCount: selectedTrip.pictures.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
