import 'package:flutter/material.dart';
import 'package:wycieczkomat_app/screens/user_profile_screen/widgets/options_widget.dart';

import 'package:wycieczkomat_app/screens/user_profile_screen/widgets/profile_picture_widget.dart';

import 'package:wycieczkomat_app/screens/user_trips_screen/user_trips_screen.dart';

import '../../back_button_widget.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = '/user-profile';

  @override
  Widget build(BuildContext context) {
    final profilePicture = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        leading: BackButtonWidget(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Profil',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ProfilePictureWidget(profilePicture: profilePicture),
          SizedBox(
            height: 20,
          ),
          OptionsWidget(
            icon: Icons.local_airport,
            name: 'Wycieczki',
            screen: UserTripsScreen.routeName,
          ),
          OptionsWidget(
            icon: Icons.settings,
            name: 'Ustawienia',
            screen: 'screen',
          ),
          OptionsWidget(
            icon: Icons.logout,
            name: 'Wyloguj',
            screen: 'screen',
          ),
        ],
      ),
    );
  }
}
