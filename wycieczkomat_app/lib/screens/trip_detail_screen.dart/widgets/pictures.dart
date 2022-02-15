import 'package:flutter/material.dart';

class Pictures extends StatelessWidget {
  const Pictures({
    Key? key,
    required this.picture,
  }) : super(key: key);
  final String picture;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: EdgeInsets.all(10),
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            picture,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ]);
  }
}
