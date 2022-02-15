import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wycieczkomat_app/providers/user_trips.dart';
import 'package:wycieczkomat_app/screens/add_user_trip_screen/add_user_trip_screen.dart';
import 'package:wycieczkomat_app/screens/home_page_screen/home_screen.dart';
import 'package:wycieczkomat_app/screens/trip_detail_screen.dart/trip_detail_screen.dart';
import 'package:wycieczkomat_app/screens/user_profile_screen/user_profile_screen.dart';

import 'package:wycieczkomat_app/screens/user_trips_screen/user_trips_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => UserTrips(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Color(0xFFF3F5F7),
          errorColor: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        routes: {
          UserProfileScreen.routeName: (ctx) => UserProfileScreen(),
          TripDetailScreen.routeName: (ctx) => TripDetailScreen(),
          UserTripsScreen.routeName: (ctx) => UserTripsScreen(),
          AddUserTripScreen.routeName: (ctx) => AddUserTripScreen(),
        },
      ),
    );
  }
}
