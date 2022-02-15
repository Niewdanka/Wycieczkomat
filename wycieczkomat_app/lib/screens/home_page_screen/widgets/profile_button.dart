import 'package:flutter/material.dart';

import 'package:wycieczkomat_app/screens/user_profile_screen/user_profile_screen.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    Key? key,
    required this.profileImage,
  }) : super(key: key);

  final String profileImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 15,
        top: 5,
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          UserProfileScreen.routeName,
          arguments: profileImage,
        ),
        child: CircleAvatar(
          backgroundImage: NetworkImage(profileImage),
        ),
      ),
    );
  }
}
