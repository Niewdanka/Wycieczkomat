import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wycieczkomat_app/back_button_widget.dart';

import 'package:wycieczkomat_app/providers/user_trips.dart';
import 'package:wycieczkomat_app/screens/add_user_trip_screen/add_user_trip_screen.dart';

class UserTripsScreen extends StatelessWidget {
  const UserTripsScreen({Key? key}) : super(key: key);
  static const routeName = '/user-trip';

  @override
  Widget build(BuildContext context) {
    final userTrips = Provider.of<UserTrips>(context);

    return Scaffold(
      appBar: AppBar(
        leading: BackButtonWidget(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(
              context,
              AddUserTripScreen.routeName,
            ),
            icon: Icon(
              Icons.add,
              color: Colors.green[800],
              size: 30,
            ),
          ),
        ],
        title: Text(
          'Twoje Wycieczki',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, i) => Dismissible(
                key: ValueKey(userTrips.items[i].id),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 40,
                  ),
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(
                    right: 20,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                ),
                onDismissed: (ctx) =>
                    userTrips.deleteUserTrip(userTrips.items[i].id),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 10,
                        spreadRadius: 4,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(10),
                        ),
                        child: Image.network(
                          userTrips.items[i].pictures[0],
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: 130,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    userTrips.items[i].place.city,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    userTrips.items[i].name,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  Text(
                                    '\$ ${userTrips.items[i].price.toString()}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.green[700],
                                  borderRadius: BorderRadius.circular(10)),
                              width: 40,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${userTrips.items[i].rating.toString()}.0',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              itemCount: userTrips.items.length,
            ),
          )
        ],
      ),
    );
  }
}
