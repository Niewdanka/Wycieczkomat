import 'package:flutter/material.dart';

class OptionsWidget extends StatelessWidget {
  const OptionsWidget({
    Key? key,
    required this.icon,
    required this.name,
    required this.screen,
  }) : super(key: key);

  final IconData icon;
  final String name;
  final String screen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        screen,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 35,
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Icon(
              (Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }
}
