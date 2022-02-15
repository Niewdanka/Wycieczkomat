import 'package:flutter/material.dart';

import 'package:wycieczkomat_app/models/trip.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key? key,
    required this.selectedTrip,
  }) : super(key: key);

  final Trip selectedTrip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        selectedTrip.description,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
