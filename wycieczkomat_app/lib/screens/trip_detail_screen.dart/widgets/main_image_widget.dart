import 'package:flutter/material.dart';
import 'package:wycieczkomat_app/back_button_widget.dart';

import 'package:wycieczkomat_app/models/trip.dart';

class MainImageWidget extends StatelessWidget {
  const MainImageWidget({
    Key? key,
    required this.selectedTrip,
    required this.coutryInfoText,
  }) : super(key: key);

  final Trip selectedTrip;
  final String? coutryInfoText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.network(
            selectedTrip.pictures[0],
            fit: BoxFit.cover,
            width: double.infinity,
            height: 280,
          ),
          Positioned(
            top: 0,
            left: 10,
            child: SafeArea(
              child: BackButtonWidget(
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 260,
            left: 0,
            right: 0,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
          Positioned(
            bottom: 50,
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
                    selectedTrip.place.city,
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
                        coutryInfoText!,
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
        ],
      ),
    );
  }
}
