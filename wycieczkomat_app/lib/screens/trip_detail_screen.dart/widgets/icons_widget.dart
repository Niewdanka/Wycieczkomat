import 'package:flutter/material.dart';

class IconsWidget extends StatelessWidget {
  const IconsWidget({
    required this.transport,
    Key? key,
  }) : super(key: key);
  final String? transport;

  Widget buildIcon(
    IconData icon,
    String name,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          size: 24,
          color: Colors.grey[800],
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildIcon(Icons.wifi, 'Free Wifi'),
          buildIcon(Icons.airport_shuttle_outlined, transport!),
          // buildIcon(Icons.beach_access_rounded, 'Wifi'),
          buildIcon(Icons.cloud_outlined, 'Słonecznie'),
          //buildIcon(Icons.restaurant_menu_rounded, 'Bar i Restauracje'),
        ],
      ),
    );
  }
}
