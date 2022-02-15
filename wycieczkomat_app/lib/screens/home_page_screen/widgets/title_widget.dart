import 'package:flutter/material.dart';

class TitleWigdet extends StatelessWidget {
  const TitleWigdet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Dokąd się wybierasz?',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
    );
  }
}
