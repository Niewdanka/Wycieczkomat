import 'package:flutter/material.dart';

import 'package:wycieczkomat_app/data.dart';
import 'package:wycieczkomat_app/screens/home_page_screen/widgets/profile_button.dart';
import 'package:wycieczkomat_app/screens/home_page_screen/widgets/title_widget.dart';
import 'package:wycieczkomat_app/screens/home_page_screen/widgets/trip_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String profileImage =
        'https://banner2.cleanpng.com/20180418/xqw/kisspng-avatar-computer-icons-business-business-woman-5ad736ba3f2735.7973320115240536902587.jpg';

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          ProfileButton(profileImage: profileImage),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          TitleWigdet(),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, i) => TripWidget(
                tripId: DATA_TRIP[i].id,
                name: DATA_TRIP[i].name,
                imageUrl: DATA_TRIP[i].pictures,
                city: DATA_TRIP[i].place.city,
                country: DATA_TRIP[i].place.country,
                rating: DATA_TRIP[i].rating,
                transportType: DATA_TRIP[i].transportType,
              ),
              itemCount: DATA_TRIP.length,
            ),
          ),
        ],
      ),
    );
  }
}
